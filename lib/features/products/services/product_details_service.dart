import 'dart:convert';

import 'package:amazon/constants.dart';
import 'package:amazon/features/models/product.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:amazon/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProductDetailsService {
  void addToCart({
    required BuildContext context,
    required Product product,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      // http.Response res = await http.post(
      //   Uri.parse('$uri/api/add-to-cart'),
      //   headers: {
      //     'Content-Type': 'application/json; charset=UTF-8',
      //     'x-auth-token': userProvider.user.token,
      //   },
      //   body: jsonEncode({
      //     'id': product.id!,
      //   }),
      // );

      // httpErrorHandle(
      //   response: res,
      //   context: context,
      //   onSuccess: () {
      //     User user =
      //         userProvider.user.copyWith(cart: jsonDecode(res.body)['cart']);
      //     userProvider.setUserFromModel(user);
      //   },
      // );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void rateProduct({
    required BuildContext context,
    required Product product,
    required double rating,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/product/rate'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'productId': product.id!,
          'rating': rating,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, "Product rated successfully!");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
