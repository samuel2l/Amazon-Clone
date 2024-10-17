const mongoose= require("mongoose")
const userSchema=mongoose.Schema({
    name:{
        required:true,
        type: String,
        trim:true
    },
    email:{
        required:true,
        type: String,
        trim:true,
        validate:{
            validator:(value)=>{
                const regex =
                /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
              return value.match(regex);
            },
            message:'Invalid email address'
        }
    },
    password:{
        required:true,
        type: String,
    },
    address:{
        type:String,
        default:''
    },
    type:{//user type
        type:String,
        default:'user'
    }
})

const User=mongoose.model('User',userSchema)
module.exports=User