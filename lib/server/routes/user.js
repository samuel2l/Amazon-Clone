print = console.log;
const express = require("express");
const userRouter = express.Router();
const User = require("../models/user");
const Product = require("../models/product");

const auth = require("../middleware/auth");

FormatData = (data) => {
  if (data) {
    return { data };
  } else {
    // throw new Error("Data Not found!");
    console.log("data snot found ");
  }
};

async function AddCartItem(customerId, product, amount, isRemove) {
  const user = await User.findById(customerId);
  const _id = product._id;
  const produ = await Product.findById(_id);
  if (!produ) {
    throw new Error("Product not found");
  }

  if (user.cart) {
    let isExist = false;

    // Iterate over the cart items and update the existing product if found
    user.cart.forEach((item, index) => {
      if (item.product._id.toString() === _id.toString()) {
        if (isRemove) {
          // Remove the item from the cart
          user.cart.splice(index, 1);
        } else {
          // Update the existing item's amount
          item.amount = amount;
        }
        isExist = true;
      }
    });

    // Add a new product to the cart if it doesn't already exist and is not a remove operation
    if (!isExist && !isRemove) {
      user.cart.push({
        product: {
          _id: produ._id,
          name: produ.name,
          price: produ.price,
          description: produ.description,
          stock: produ.stock,
          category: produ.category,
          ratings: produ.ratings,
          images: produ.images,
        },
        amount,
      });
    }

    console.log("Updated cart:", user.cart);

    return await user.save();
  } else {
    throw new Error("Cart not found for user.");
  }
}
async function ManageCart(customerId, item, amount, isRemove) {
  const cartResult = await AddCartItem(customerId, item, amount, isRemove);
  return FormatData(cartResult);
}

userRouter.put("/user/cart", auth, async (req, res, next) => {
  const userId = req.user;
  const { product, amount, isRemove = false } = req.body;
  const { data } = await ManageCart(userId, product, amount, isRemove);
  res.status(200).json(data);
});

userRouter.get("/user/cart", auth, async (req, res, next) => {
  const _id = req.user;

  const { data } = await service.GetCart({ _id });

  return res.status(200).json(data);
});

module.exports = userRouter;
