import 'dart:convert';

import 'package:amazon/constants.dart';
import 'package:amazon/features/models/product.dart';
import 'package:amazon/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchService {
  fetchSearchedProduct(String query, BuildContext context) async {
    try {

      http.Response response = await http.get(
        Uri.parse('$uri/products/search/$query'),
      );

      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Products loaded successfully');
        },
      );
      List<Product> products =
          (jsonDecode(response.body) as List).map((productJson) {
        return Product.fromJson(productJson);
      }).toList();


      return products;
    } catch (e) {
      showSnackBar(context, e.toString());
      return []; 
    }
  }
}
