// const mongoose = require('mongoose');

// const orderSchema = new mongoose.Schema({
//   orderId: {
//     type: String,
//     required: true,
//     unique: true,
//   },
//   customerId: {
//     type: String,
//     required: true,
//   },
//   amount: {
//     type: Number,
//     required: true,
//   },
//   items: [
//     {
//       productId: {
//         type: String,
//         required: true,
//       },
//       name:{
//         type:String,
//         required:true

//       },
//       quantity: {
//         type: Number,
//         required: true,
//         min: 1,
//       },
//       price: {
//         type: Number,
//         required: true,
//       },
//     },
//   ],

// });

// const Oder = mongoose.model('order', orderSchema);


// module.exports = Order;


const mongoose= require("mongoose")

const orderSchema=mongoose.Schema({
      orderId: {
    type: String,
    required: true,
    unique: true,
  },
  userId: {
    type: String,
    required: true,
  },
  amount: {
    type: Number,
    required: true,
  },
  status:String,
  items: [
    {
      product: {
        _id: {
          type: mongoose.Schema.Types.ObjectId,
          ref: 'Product', // Reference to a Product model
          required: true,
        },
        name: {
          type: String,
          required: true,
        },
        price: {
          type: Number,
          required: true,
        },
        description: {
          type: String,
        },
        stock: {
          type: Number,
          required: true,
        },
        category: {
          type: String,
          required: true,
        },
        images: [
          {
            type: String,
          },
        ],
        ratings: [
          {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'Rating', // Reference to a Rating model (if you have one)
          },
        ],
      },
      amount: {
        type: Number,
        required: true,
        min: 1,
      },
    },
  ],

},{ timestamps: true })

const Order=mongoose.model('Order',orderSchema)
module.exports=Order

