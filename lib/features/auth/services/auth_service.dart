// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:amazon/constants.dart';
import 'package:amazon/features/home/screens/home.dart';
import 'package:amazon/features/models/user.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:amazon/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  void signUp(
      {required String name,
      required String password,
      required String email,
      required BuildContext context}) async {
    try {
      User user = User(
          id: '',
          name: name,
          password: password,
          address: '',
          type: '',
          token: '',
          email: email);
      http.Response response = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(response.body);
      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Account created!');
          });
    } catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, e.toString());
    }
  }

  void login(
      {required String password,
      required String email,
      required BuildContext context}) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$uri/api/login'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(response.body);
      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('x-auth-token', jsonDecode(response.body)['token']);
            Provider.of<UserProvider>(context, listen: false)
                .setUser(response.body);
            Navigator.pushNamedAndRemoveUntil(
              // ignore: use_build_context_synchronously
              context,
              Home.routeName,
              (route) => false,
            );
          });
    } catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, e.toString());
    }
  }
}
