print=console.log
const express=require('express')

const authRouter=express.Router()
const User=require('../models/user')
authRouter.post(
    '/api/signup', async (request,response)=>{
try {        const {name,email,password}=request.body
        const existingUser=await User.findOne({email:email})
        //but in js if key and val same you can just provide one 
        //so line abv is same as User.findOne({email})
        if(existingUser){
            return response.status(400).json({message:'A user with this email already exists'})
        }
        let new_user=new User({name,email,password})
        new_user=await new_user.save()
        print('new user')
        print(new_user)

 response.json(new_user)
}catch(e){
    response.status(500).json({error:e.message})
}




    }
)
module.exports=authRouter