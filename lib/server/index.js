print=console.log
const express=require('express')
const PORT=3000
const app=express()

// app.get('/',function(req,res){
//     // res.send('heyyyyy?') will send in normal text form
//     res.json({'key':"using json"})
// })
// so every route you do this app.get
//but its not very tidy so split into files,export those files and you can use em here
const authRouter=require('./routes/auth')
app.use(authRouter)
app.listen(PORT,"0.0.0.0",function (){
    print('hey there',PORT)
})