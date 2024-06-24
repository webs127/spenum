import 'package:flutter/material.dart';
import 'package:spenum/app/route.dart';

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
          child: Center(
            child: MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteManager.play);
              },
              minWidth: 129,
              height: 52,
              color: Colors.white,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26)
              ),
              child: const Text("Play", style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w800,
              color: Colors.black
            ),),
              )
          ),
        ),
      ),
    );
  }
}