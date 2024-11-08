import 'package:amazon/constants.dart';
import 'package:amazon/features/account/widgets/orders.dart';
import 'package:amazon/features/account/widgets/top_btn.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          // This widget is used to override the default size of a child widget.
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: appBarGradient,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/amazon_in.png',
                    width: 120,
                    height: 45,
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(Icons.notifications_outlined),
                      ),
                      Icon(
                        Icons.search,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: appBarGradient,
              ),
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Hello, ',
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: user.name,
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            TopButtons(),
            SizedBox(height: 20),
            Orders(),
          ],
        ),
      ),
    );
  }
}
