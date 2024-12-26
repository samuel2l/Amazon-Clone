const mongoose= require("mongoose")
const productSchema=mongoose.Schema({
    name:{
        required:true,
        type: String,
        trim:true
    },
    price:{
        required:true,
        type: Number,
        
    },
    description:{
        required:true,
        type: String,
        trim:true
    },
    stock:{
        required:true,
        type:Number,
        
    },
    category:{
        required:true,
        type:String,
        enum:["Essentials","Books","Fashion","Mobiles","Electronics"]
    },
    images:[
        {
            type:String,
            required:true
        }
    ]
})

const Product=mongoose.model('Product',productSchema)
module.exports=Product
