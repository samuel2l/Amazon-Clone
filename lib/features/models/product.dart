// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  final String name;
  final dynamic price;
  final String description;
  final int stock;
  final String? id;

  final String category;
  final List<String> images;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'description': description,
      'stock': stock,
      'id': id,
      'category': category,
      'images': images,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        name: map['name'] as String,
        price: (map['price'] ?? 0).toDouble(),
        description: map['description'] as String,
        stock: map['stock'] as int,
        id: map['_id'] != null ? map['_id'] as String : null,
        category: map['category'] as String,
        images: List<String>.from(map['images'] as List<dynamic>),
        // the as list<dynamic> probably not needed cos all images from db are already strings but are dynamic when you use json decode
        
        );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
  Product(
      {required this.name,
      required this.price,
      required this.description,
      required this.stock,
      required this.category,
      required this.images,
      this.id});
}
