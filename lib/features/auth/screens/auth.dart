import 'package:amazon/constants.dart';
import 'package:amazon/features/auth/services/auth_service.dart';
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
  final AuthService authService = AuthService();
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

  void signUp() {
    authService.signUp(
      name: nameController.text.trim(),
      password: passwordController.text.trim(),
      email: emailController.text.trim(),
    );
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
                activeColor: secondaryColor,
                value: 'signUp',
                groupValue: auth,
                onChanged: (value) => setState(() {
                  auth = value!;
                }),
              ),
            ),
            auth == 'signUp'
                ? Form(
                    key: signUpKey, // Add the key here
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextFormField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              hintText: 'Enter your name',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null; //means input has been validated
                            },
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              hintText: 'Enter your email',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null; //means input has been validated
                            },
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: 'Enter a password',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              }

                              return null; //means input has been validated
                            },
                          ),
                          const SizedBox(height: 8),
                          TextButton(
                            onPressed: () {
                              if (signUpKey.currentState!.validate()) {
                                signUp();
                              }
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: secondaryColor,
                              elevation: 1,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text('Sign Up'),
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
                }),
              ),
            ),
            auth == 'logIn'
                ? Form(
                    key: logInKey, // Add the key here
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextFormField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              hintText: 'Enter your email',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null; //means input has been validated
                            },
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: 'Enter your password',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null; //means input has been validated
                            },
                          ),
                          const SizedBox(height: 8),
                          TextButton(
                            onPressed: () {
                              if (logInKey.currentState!.validate()) {
                                // Perform login
                              }
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: secondaryColor,
                              elevation: 1,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text('Log In'),
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
