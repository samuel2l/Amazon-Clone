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
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                              hintText: 'enter your name',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26),
                              )),
                          validator: (value) {},
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: 'Enter your email',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26),
                            ),
                          ),
                          validator: (value) {},
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Enter a password',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26),
                            ),
                          ),
                          validator: (value) {},
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: secondaryColor,
                            elevation: 1,
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  12), // Adjust the value for more/less rounding
                            ),
                          ),
                          child: const Text(
                            'Sign Up',
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          ListTile(
            title: const Text('Log in'),
            leading: Radio(
                activeColor: secondaryColor,
                value: 'logIn',
                groupValue: auth,
                onChanged: (value) => setState(() {
                      auth = value!;
                    })),
          ),
          auth == 'logIn'
              ? Form(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // TextFormField(
                        //   controller: nameController,
                        //   decoration: const InputDecoration(
                        //       hintText: 'enter your name',
                        //       border: OutlineInputBorder(
                        //         borderSide: BorderSide(color: Colors.black26),
                        //       ),
                        //       enabledBorder: OutlineInputBorder(
                        //         borderSide: BorderSide(color: Colors.black26),
                        //       )),
                        //   validator: (value) {},
                        // ),
                        // const SizedBox(
                        //   height: 8,
                        // ),
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: 'Enter your email',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26),
                            ),
                          ),
                          validator: (value) {},
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26),
                            ),
                          ),
                          validator: (value) {},
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: secondaryColor,
                            elevation: 1,
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  12), // Adjust the value for more/less rounding
                            ),
                          ),
                          child: const Text(
                            'Log In ',
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      )),
    );
  }
}
