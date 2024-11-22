import 'package:amazon/constants.dart';
import 'package:amazon/features/account/screens/account.dart';
import 'package:amazon/features/admin/screens/admin.dart';
import 'package:amazon/features/auth/screens/auth.dart';
import 'package:amazon/features/auth/services/auth_service.dart';
import 'package:amazon/features/common/widgets/bottom_navbar.dart';
import 'package:amazon/features/home/screens/home.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:amazon/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UrbanNest',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: const AppBarTheme(
            elevation: 0, iconTheme: IconThemeData(color: Colors.black)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      // home: Provider.of<UserProvider>(context).user.token.isNotEmpty
      //     ? Provider.of<UserProvider>(context).user.type=='user'? const BottomNavBar():const Admin()
      //     : const Auth(),
      home: const Admin(),
      debugShowCheckedModeBanner: false,
    );
  }
}
