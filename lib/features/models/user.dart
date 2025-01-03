// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:amazon/features/models/cartItem.dart';

class User {
  final String id;
  final String name;
  final String password;
  final String address;
  final String type;
  final String token;

  final String email;
  final List<CartItem> cart;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'password': password,
      'address': address,
      'type': type,
      'token': token,
      'email': email,
      'cart':cart
    };
  }
User copyWith({
    String? id,
    String? name,
    String? password,
    String? address,
    String? type,
    String? token,
    String? email,
    List<CartItem>? cart,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      password: password ?? this.password,
      address: address ?? this.address,
      type: type ?? this.type,
      token: token ?? this.token,
      email: email ?? this.email,
      cart: cart ?? this.cart,
    );
  }
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] as String,
      name: map['name'] as String,
      password: map['password'] as String,
      address: map['address'] as String,
      type: map['type'] as String,
      token: map['token'] as String,
      email: map['email'] as String,
      cart: (map['cart'] as List<dynamic>)
          .map((item) => CartItem.fromMap(item as Map<String, dynamic>))
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  User(
      {required this.id,
      required this.name,
      required this.password,
      required this.address,
      required this.type,
      required this.token,
      required this.email,
      required this.cart
      });
}
