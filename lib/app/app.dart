import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spenum/app/route.dart';
import 'package:spenum/services/random_number_generator_viewmodel.dart';

class MyApp extends StatelessWidget {
   const MyApp._internal();
  static MyApp instance = const MyApp._internal();
  factory MyApp() => instance;

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(375,812),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RandomNumberGeneratorViewmodel())
        ],
        child: const MaterialApp(
          initialRoute: RouteManager.splash,
          onGenerateRoute: Routes.getRoute,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}