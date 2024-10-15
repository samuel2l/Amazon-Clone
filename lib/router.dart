import 'package:amazon/features/auth/screens/auth.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){
switch(routeSettings.name){
  case Auth.routeName:return MaterialPageRoute(builder: (_)=>const Auth(),settings: routeSettings);
default:
return MaterialPageRoute(builder: (_)=>const Text('this page does not exist'),settings: routeSettings);
}
}