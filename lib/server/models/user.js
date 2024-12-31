const mongoose = require("mongoose");
const userSchema = mongoose.Schema({
  name: {
    required: true,
    type: String,
    trim: true,
  },
  email: {
    required: true,
    type: String,
    trim: true,
    validate: {
      validator: (value) => {
        const regex =
          /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return value.match(regex);
      },
      message: "Invalid email address",
    },
  },
  password: {
    required: true,
    type: String,
  },
  address: {
    type: String,
    default: "",
  },

  type: {
    type: String,
    default: "user",
  },
  cart: [
    {
      product: {
        _id: {
          required:true,
          type: String,
          trim: true,
        },
        name: {
          
          type: String,
          trim: true,
        },
        price: {
          
          type: Number,
        },
        description: {
          
          type: String,
          trim: true,
        },
        stock: {
          
          type: Number,
        },
        category: {
          
          type: String,
          enum: ["Essentials", "Books", "Fashion", "Mobiles", "Electronics"],
        },
        images: [
          {
            type: String,
            
          },
        ],
        ratings: [
          {
            userId: {
              type: String,
              
            },
            rating: {
              type: Number,
              
            },
          },
        ],
      },
      amount: { type: Number, require: true },
    },
    { _id: false },
  ],
});

const User = mongoose.model("User", userSchema);
module.exports = User;
