import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spenum/app/route.dart';

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
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.red,
            Colors.black
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
          )
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const Center(
            child: Text("SPENUM",
             style: TextStyle(
              fontSize: 40,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
            
            ),
          ),
        ),
      ),
    );
  }
}