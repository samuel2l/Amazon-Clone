import 'dart:convert';

import 'package:amazon/features/admin/screens/add_product.dart';
import 'package:amazon/features/admin/services/admin_service.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: productList.length,
          itemBuilder: (context, index) {
            var product = productList[index];
            List<String> images = product['images'].cast<String>();
            print(images);
            return Column(
              children: [
                // SizedBox(
                //   height: 180,
                //   child: Image.network(
                //     product['images'][0],
                //     fit: BoxFit.fitHeight,
                //   ),
                // ),
                CarouselSlider(
                  items: images.map((img) {
                    return Image.network(img);
                  }).toList(),
                  options: CarouselOptions(viewportFraction: 1),
                ),

                Align(
                    alignment: Alignment.topLeft, child: Text(product['name']))
              ],
            );
          },
        ),
      ),
    );
  }
}
