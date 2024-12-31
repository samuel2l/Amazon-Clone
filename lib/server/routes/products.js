print = console.log;
const express = require("express");
const productsRouter = express.Router();
const Product = require("../models/product");

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

module.exports = productsRouter;
