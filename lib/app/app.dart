import 'package:flutter/material.dart';
import 'package:spenum/app/route.dart';

class MyApp extends StatelessWidget {
   const MyApp._internal();
  static MyApp instance = const MyApp._internal();
  factory MyApp() => instance;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: RouteManager.splash,
      onGenerateRoute: Routes.getRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}