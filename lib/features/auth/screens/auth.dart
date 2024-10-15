import 'package:amazon/constants.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  static const String routeName = 'auth';
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  String auth = 'signUp';
  final signUpKey = GlobalKey<FormState>();
  final logInKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyBackgroundCOlor,
      body: SafeArea(
          child: Column(
        children: [
          ListTile(
            title: const Text('Create account'),
            leading: Radio(
                // the value and group value have to be of same type and this also affects the value parameer the onchanged will take
                activeColor: secondaryColor,
                value: 'signUp',
                groupValue: auth,
                onChanged: (value) => setState(() {
                      auth = value!;
                    })),
          ),
          auth == 'signUp'
              ? Form(
                  child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                        ),
                      ),
                      validator: (value) {},
                    ),
                                        TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                        ),
                      ),
                      validator: (value) {},
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                        ),
                      ),
                      validator: (value) {},
                    ),

                  ],
                ))
              : const SizedBox.shrink(),
          ListTile(
            title: const Text('Log in'),
            leading: Radio(
                activeColor: secondaryColor,
                value: 'signIn',
                groupValue: auth,
                onChanged: (value) => setState(() {
                      auth = value!;
                    })),
          ),
        ],
      )),
    );
  }
}
