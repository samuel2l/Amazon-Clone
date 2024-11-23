let print=console.log
const express=require('express')
const adminRouter=express.Router()
const Product=require('../models/product')
const admin=require('../middleware/admin')

adminRouter.post('/admin/add-product',admin,async(req,res)=>{
    try{
        const {name,price,description,stock,category,images}=req.body
        let new_product=new Product({name,price,description,stock,category,images})
         new_product=await new_product.save()
         res.json(new_product)

    }catch{
        res.status(500).json({error:e.message})
    }
})

adminRouter.get('/admin/products',admin,async(req,res)=>{
    try{
        const products=await Product.find({})
        print(products)
        res.json(products)

 
    }catch{
        res.status(500).json({error:e.message})

    }
})

module.exports=adminRouter