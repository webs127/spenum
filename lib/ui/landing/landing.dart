import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spenum/app/route.dart';
import 'package:spenum/core/color_manager.dart';
import 'package:spenum/widgets/custom_materialbutton.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [ColorManager.red, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomMaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteManager.play);
                },
                title: "Play",
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomMaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteManager.settings);
                },
                title: "Settings",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
