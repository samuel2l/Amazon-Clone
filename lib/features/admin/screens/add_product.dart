import 'package:amazon/constants.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});
  static const String routeName = '/admin/add-product';

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: appBarGradient),
        ),
        title: const Text(
          'Add a product',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
