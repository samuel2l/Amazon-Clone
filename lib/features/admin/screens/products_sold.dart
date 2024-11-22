import 'package:amazon/features/admin/screens/add_product.dart';
import 'package:flutter/material.dart';

class ProductsSold extends StatefulWidget {
  const ProductsSold({super.key});

  @override
  State<ProductsSold> createState() => _ProductsSoldState();
}

class _ProductsSoldState extends State<ProductsSold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddProduct.routeName);
        },
        shape: const CircleBorder(),
        tooltip: 'Add New product',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
