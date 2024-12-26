print = console.log;
const express = require("express");
const productsRouter = express.Router();
const Product = require("../models/product");

productsRouter.get("/products/:category", async (req, res, next) => {
  try {
    const category = req.params.category;
    const products = await Product.find({category});
    print(products);
    res.status(200).json(products);
  } catch (err) {
    print(err);
    res.status(500).json({msg:err.message});
  }
});

module.exports = productsRouter;
