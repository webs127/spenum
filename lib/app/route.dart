import 'package:flutter/material.dart';
import 'package:spenum/ui/landing/landing.dart';
import 'package:spenum/ui/play/play.dart';
import 'package:spenum/ui/splash/splash.dart';

class RouteManager {
  static const String splash = "/";
  static const String landing = "/landing";
  static const String play = "/play";
}

class Routes {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteManager.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteManager.landing:
        return MaterialPageRoute(builder: (_) => const LandingScreen());
      case RouteManager.play:
        return MaterialPageRoute(builder: (_) => const PlayScreen());
      default:
        return undefined();
    }
  }

  static Route<dynamic> undefined() {
    return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
