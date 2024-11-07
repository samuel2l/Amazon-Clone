print=console.log
const express=require('express')
const bcrypt=require('bcryptjs')
const authRouter=express.Router()
const jwt=require('jsonwebtoken')
const User=require('../models/user')
const auth = require("../middleware/auth");
authRouter.post(
    '/api/signup', async (request,response)=>{
try {        const {name,email,password}=request.body
            let hash=await bcrypt.hash(password,8)
        const existingUser=await User.findOne({email:email})
        //but in js if key and val same you can just provide one 
        //so line abv is same as User.findOne({email})
        if(existingUser){
            return response.status(400).json({msg:'A user with this email already exists'})
        } 
        let new_user=new User({name,email,password:hash})
        new_user=await new_user.save()
        print('new user')
        print(new_user)
        response.json(new_user)
}catch(e){
    response.status(500).json({error:e.message})
}
    }
)

authRouter.post(
    '/api/login', async (request,response)=>{
try {        const {email,password}=request.body
             const existingUser=await User.findOne({email:email})
        if(!existingUser){
            return response.status(400).json({msg:'No user uses this email'})
        }
        let isPasswordMatch= await bcrypt.compare(password,existingUser.password)
        if(!isPasswordMatch){
            return response.status(400).json({msg:'Password is incorrect'})
        }
            const token=jwt.sign({
                id:existingUser._id
            },"passwordKey")
            // This function generates a JSON Web Token (JWT) by encoding the given payload (data you want to store in the token) and signing it with a secret key.
            response.json({token,...existingUser._doc})
            print(existingUser)
            print('user doc then: ') 
            print(...existingUser._doc)


}catch(e){
    response.status(500).json({error:e.message})
}
    }
)

authRouter.post(
    '/tokenValid', async (request,response)=>{
try { 
const token=request.header("x-auth-token")
if(!token){
    return response.json(false)
}
const verify=jwt.verify(token,"passwordKey")
if(!verify){
    return response.json(false)
}
const existingUser=await User.findById(verify.id)
if(!existingUser){
    return response.json(false)
}
return response.json(true)
}catch(e){
    response.status(500).json({error:e.message})
}
    }
)

authRouter.get('/', auth, async (request, response) => {
    const user = await User.findById(request.user);
    print(user)
    response.json({ ...user._doc, token: request.token });
  });
 
module.exports=authRouter