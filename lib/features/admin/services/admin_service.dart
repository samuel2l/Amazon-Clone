import 'dart:io';

import 'package:amazon/constants.dart';
import 'package:amazon/features/models/product.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:amazon/utils.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AdminService {
  void addNewProduct({
    required BuildContext context,
    required String name,
    required double price,
    required String description,
    required int stock,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      List<String> imgUrls = [];
      final cloudinary = CloudinaryPublic('dvsd4zjxf', 'ztkl4b1w');
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path,
              resourceType: CloudinaryResourceType.Image, folder: name),
        );
        print(response.secureUrl);
        print('response.secureUrl');
        print(response);
        imgUrls.add(response.secureUrl);
      }
      Product product = Product(
          name: name,
          price: price,
          description: description,
          stock: stock,
          category: category,
          images: imgUrls);
      http.Response response = await http.post(
        Uri.parse('$uri/admin/add-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token
        },
        body: product.toJson(),
      );
      httpErrorHandle(
          response: response,
          // ignore: use_build_context_synchronously
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Product added successfully');
            Provider.of<UserProvider>(context, listen: false)
                .setUser(response.body);
            Navigator.pop(
              // ignore: use_build_context_synchronously
              context,
            );
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
