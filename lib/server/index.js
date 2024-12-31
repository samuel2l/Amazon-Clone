print=console.log
const express=require('express')
const mongoose=require('mongoose')
const PORT=3000
const DB='mongodb+srv://samuel:123@cluster0.puaxm.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0'

const app=express()
const authRouter=require('./routes/auth')
const adminRouter = require('./routes/admin')
const productsRouter = require('./routes/products')
const userRouter=require('./routes/user')
app.use(express.json())
app.use(authRouter) 
app.use(adminRouter) 
app.use(productsRouter) 
app.use(userRouter)
//conection to db
mongoose.connect(DB).then(()=>{
    print('connection successful')
}).catch((error)=>{print(error)})
app.listen(PORT,"0.0.0.0",function (){
    print('hey there',PORT)
})