// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:amazon/constants.dart';
import 'package:amazon/features/models/user.dart';
import 'package:http/http.dart' as http;

class AuthService {
  void signUp({
    required String name,
    required String password,
    required String email,
  }) async {
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
    } catch (e) {
      print(e);
    }
  }
}
 