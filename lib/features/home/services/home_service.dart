import 'package:amazon/constants.dart';
import 'package:amazon/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeService {
  getProductsByCategory({
    required BuildContext context,
    required String category,
  }) async {
    try {
      http.Response response = await http.get(
        Uri.parse('$uri/products/$category'),
      );
      print(response.body);
      httpErrorHandle(
          response: response,
          // ignore: use_build_context_synchronously
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Products loaded successfully');
          });
      return response.body;
    } catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, e.toString());
    }
  }
}
