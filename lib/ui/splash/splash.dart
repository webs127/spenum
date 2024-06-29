import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spenum/app/route.dart';
import 'package:spenum/core/color_manager.dart';
import 'package:spenum/core/textstyle_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void start() {
    Future.delayed(const Duration(seconds: 3), _nextPage);
  }

  void _nextPage() {
    Navigator.pushReplacementNamed(context, RouteManager.landing);
  }

  @override
  void initState() {
    super.initState();
    start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [ColorManager.red, ColorManager.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Text(
              "SPENUM",
              style: italicTextStyle(
                  fontSize: 40.sp,
                  fontStyle: FontStyle.italic,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
