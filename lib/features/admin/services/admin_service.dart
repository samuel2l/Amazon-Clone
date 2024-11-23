import 'dart:io';


import 'package:amazon/features/models/product.dart';
import 'package:amazon/utils.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';


class AdminService {
  void addNewProduct({ required BuildContext context,required String name,required double price,required String description,required int stock,required List<File> images})async{
    try{      
      List<String> imgUrls=[];
       final cloudinary=CloudinaryPublic('dvsd4zjxf', 'ztkl4b1w');
       for(int i=0;i<images.length;i++){
         CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(images[i].path, resourceType: CloudinaryResourceType.Image,folder: name),
    );
     print(response.secureUrl);
       print('response.secureUrl');
      print(response);
      imgUrls.add(response.secureUrl);

Product product=Product(name: name, price: price, description: description, stock: stock, images: imgUrls);
       }
    

}catch(e){
      showSnackBar(context, e.toString());
    }
  }
}