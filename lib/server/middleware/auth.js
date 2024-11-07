const jwt=require('jsonwebtoken')
let print=console.log
const auth = async (request, response, next) => {
  try {
    const token = request.header('x-auth-token');
    if (!token){
      print('No token')
      return response.status(401).json({ msg: "No auth token, access denied" });

    }

    const verified = jwt.verify(token, "passwordKey");
    if (!verified){
      print("Token verification failed, authorization denied.")  
      return response
        .status(401)
        .json({ msg: "Token verification failed, authorization denied." });
        
    }
    request.user = verified.id;
    request.token = token;
    next();
  } catch (err) {
    print(err)
    response.status(500).json({ error: err.message });
  }
};

module.exports = auth;