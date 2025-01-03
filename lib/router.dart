import 'package:amazon/features/address/screens/address.dart';
import 'package:amazon/features/admin/screens/add_product.dart';
import 'package:amazon/features/auth/screens/auth.dart';
import 'package:amazon/features/common/widgets/bottom_navbar.dart';
import 'package:amazon/features/home/screens/home.dart';
import 'package:amazon/features/home/screens/products_by_category.dart';
import 'package:amazon/features/models/product.dart';
import 'package:amazon/features/products/screens/product_details.dart';
import 'package:amazon/features/search/screens/search.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Auth.routeName:
      return MaterialPageRoute(
          builder: (_) => const Auth(), settings: routeSettings);
    case Home.routeName:
      return MaterialPageRoute(
          builder: (_) => const Home(), settings: routeSettings);
    case BottomNavBar.routeName:
      return MaterialPageRoute(
          builder: (_) => const BottomNavBar(), settings: routeSettings);
    case AddProduct.routeName:
      return MaterialPageRoute(
          builder: (_) => const AddProduct(), settings: routeSettings);
    case ProductsByCategory.routeName:
      final args = routeSettings.arguments as Map<String, String>;
      return MaterialPageRoute(
          builder: (_) => ProductsByCategory(
                category: args['category'] ?? '',
              ),
          settings: routeSettings);
    case ProductDetails.routeName:
      final args = routeSettings.arguments as Product;
      return MaterialPageRoute(
          builder: (_) => ProductDetails(
                product: args,
              ),
          settings: routeSettings);
    case Search.routeName:
      final query = routeSettings.arguments as String;
      return MaterialPageRoute(
          builder: (_) => Search(
                query: query,
              ),
          settings: routeSettings);
case Address.routeName:
      final totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
          builder: (_) => Address(
                totalAmount: totalAmount,
              ),
          settings: routeSettings);    default:
      return MaterialPageRoute(
          builder: (_) => const Text('this page does not exist'),
          settings: routeSettings);
  }
}
