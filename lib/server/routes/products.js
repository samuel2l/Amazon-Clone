print = console.log;
const express = require("express");
const productsRouter = express.Router();
const Product = require("../models/product");
const auth = require("../middleware/auth");

productsRouter.get("/products/:category", async (req, res, next) => {
  try {
    const category = req.params.category;
    const products = await Product.find({ category });
    print(products);
    res.status(200).json(products);
  } catch (err) {
    print(err);
    res.status(500).json({ msg: err.message });
  }
});

productsRouter.get("/products/search/:product", async (req, res, next) => {
  try {
    const product = req.params.product;

    const products = await Product.find({
      name: { $regex: product, $options: "i" },
    });

    console.log(products);
    res.status(200).json(products);
  } catch (err) {
    console.error(err);
    res.status(500).json({ msg: err.message });
  }
});

productsRouter.post("/product/rate/", auth, async (req, res, next) => {
  try {

    const { productId, rating } = req.body;
    const userId = req.user;
    const product = await Product.findById(productId);
    if (!product) {
      return res.status(404).json({ msg: "Product not found" });
    }
    if(!product.ratings){
      console.error("Ratings arr node");
      res.status(500).json({ msg: "Ratings arr node" });
  
    }

    const existingRating = product.ratings.find((rating) => rating.userId === userId);

    if (existingRating) {
      existingRating.rating = rating;
    } else {
      product.ratings.push({
        userId,
        rating,
      });
    }

    await product.save();
    

    res.status(200).json({msg:"ekefdefef"});
  } catch (err) {
    console.error(err);
    res.status(500).json({ msg: err.message });
  }
});

module.exports = productsRouter;
