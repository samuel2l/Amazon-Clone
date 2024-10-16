print=console.log
const express=require('express')

const authRouter=express.Router()
authRouter.get('/user',(request,response)=>{
    response.json({'name':'Samuel Adams'})
    
})
module.exports=authRouter