import 'package:amazon/constants.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const String routeName = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: appBarGradient),
        ),
        actions: [
          Container(
              padding: EdgeInsets.only(right: 50),
              child: const Icon(Icons.mic)),
        ],
        title: Container(
          height: 40,
          width: 320,
          padding: EdgeInsets.only(left: 20),
          child: TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    borderSide: BorderSide.none),
                contentPadding: EdgeInsets.all(8)),
          ),
        ),
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          children: [
            Text(user.email),
            Text('Hey there ${user.name}'),
          ],
        ),
      ),
    );
  }
}
