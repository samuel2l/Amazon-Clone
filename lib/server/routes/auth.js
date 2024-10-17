print=console.log
const express=require('express')

const authRouter=express.Router()
authRouter.post(
    '/api/signup',(request,response)=>{
        const {name,email,password}=request.body
        
    }
)
module.exports=authRouter