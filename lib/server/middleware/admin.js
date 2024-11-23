const jwt=require('jsonwebtoken');
const User = require('../models/user');
let print=console.log
const admin = async (request, response, next) => {
  try {
    const token = request.header('x-auth-token');
    if (!token){
      return response.status(401).json({ msg: "No auth token, access denied" });

    }

    const verified = jwt.verify(token, "passwordKey");
    if (!verified){

      return response
        .status(401)
        .json({ msg: "Token verification failed, authorization denied." });
           
    }
    const user=await User.findById(verified.id)
    if(user.type=='user'||user.type=='seller'){
        return response
        .status(401)
        .json({ msg: "You are not an admin hence have no access to this route" });

    }
    request.user = verified.id;
    request.token = token;
    next();
  } catch (err) {
    print('error don pai')
    print(err)
    response.status(500).json({ error: err.message });
  }
};

module.exports = admin;