import 'dart:convert';

import 'package:amazon/constants.dart';
import 'package:amazon/features/models/cartItem.dart';
import 'package:amazon/features/models/product.dart';
import 'package:amazon/features/models/user.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:amazon/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProductDetailsService {
  void editCart(
      {required BuildContext context,
      required Product product,
      required int amount,
      bool isRemove = false}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.put(
        Uri.parse('$uri/user/cart'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          "product": {
            "_id": product.id,
          },
          "amount": amount,
          "isRemove": isRemove
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Product added to cart');
          // instead of keeping the cart as part of state management you could just call api using the req.user id
          CartItem cartItem=CartItem(product: product,amount: amount);

        
int existingItemIndex = userProvider.user.cart.indexWhere(
  (item) => item.product.id == cartItem.product.id,
);

if (existingItemIndex != -1) {

  userProvider.user.cart[existingItemIndex]=cartItem;
} else {
  userProvider.user.cart.add(cartItem);
}


        },
      );
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