print=console.log
const express=require('express')
const mongoose=require('mongoose')
const PORT=3000
const DB='mongodb+srv://samuel:123@cluster0.puaxm.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0'
const app=express()
// samuel 123

// app.get('/',function(req,res){
//     // res.send('heyyyyy?') will send in normal text form
//     res.json({'key':"using json"})
// })
// so every route you do this app.get
//but its not very tidy so split into files,export those files and you can use em here
const authRouter=require('./routes/auth')
// provided by Express.js to add middleware to the app
app.use(express.json())
app.use(authRouter)

//conection to db
mongoose.connect(DB).then(()=>{
    print('connection successful')
}).catch((error)=>{print(error)})
app.listen(PORT,"0.0.0.0",function (){
    print('hey there',PORT)
})