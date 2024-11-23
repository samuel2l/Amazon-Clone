import 'dart:convert';

import 'package:amazon/features/admin/screens/add_product.dart';
import 'package:amazon/features/admin/services/admin_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsSold extends StatefulWidget {
  const ProductsSold({super.key});

  @override
  State<ProductsSold> createState() => _ProductsSoldState();
}

class _ProductsSoldState extends State<ProductsSold> {
  final AdminService adminService = AdminService();
  List productList = [];
  void getAllProducts() async {
    String res = await adminService.getAllProducts(context);

    for (int item = 0; item < (jsonDecode(res)).length; item++) {
      productList.add(jsonDecode(res)[item]);
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllProducts();
  }

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
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: productList.length,
        itemBuilder: (context, index) {
          var product = productList[index];

          return Column(
            children: [
              
              
            ],
          );
        },
      ),
    );
  }
}
