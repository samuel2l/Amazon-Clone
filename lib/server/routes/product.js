const express=require("express")
const productsRouter=express.Router()
const Product=require('../models/product')
const auth=require('../middleware/auth')
const Order=require('../models/order')
const User=require('../models/user')
const { v4: uuidv4 } = require('uuid');

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
      if (!product.ratings) {
        console.error("Ratings arr node");
        res.status(500).json({ msg: "Ratings arr node" });
      }
  
      const existingRating = product.ratings.find(
        (rating) => rating.userId === userId
      );
  
      if (existingRating) {
        existingRating.rating = rating;
      } else {
        product.ratings.push({
          userId,
          rating,
        });
      }
  
      await product.save();
  
      res.status(200).json({ msg: "ekefdefef" });
    } catch (err) {
      console.error(err);
      res.status(500).json({ msg: err.message });
    }
  });
  
  productsRouter.post("/product/order/", auth, async (req, res, next) => {
    try {
      const userId = req.user;
      const existingUser=await User.findById(userId)
      let totalAmount=0
      const orderItems = [];
      existingUser.cart.forEach((item) => {
              
        const itemTotal = parseFloat(item.product.price) * parseInt(item.amount);
        totalAmount += itemTotal;
        totalAmount = parseFloat(totalAmount.toFixed(2));
        orderItems.push(item);
    });
  console.log(orderItems)
    const orderId = uuidv4();
    const order = new Order({
        orderId,
        userId,
        amount: totalAmount,
        status: 'received',
        items: orderItems,
    });
  
  
  
    const orderResult = await order.save();
      
      existingUser.cart=[]
      await existingUser.save()
    
      res.status(200).json(orderResult)
    } catch (err) {
      console.error(err);
      res.status(500).json({ msg: err.message });
    }
  });
  
  module.exports = productsRouter;
  