import 'package:flutter/material.dart';
import 'package:spenum/ui/Input%20Answer/input_answer.dart';
import 'package:spenum/ui/landing/landing.dart';
import 'package:spenum/ui/play/play.dart';
import 'package:spenum/ui/right%20answer/right_answer.dart';
import 'package:spenum/ui/splash/splash.dart';
import 'package:spenum/ui/wrong%20answer/wrong_answer.dart';

class RouteManager {
  static const String splash = "/";
  static const String landing = "/landing";
  static const String play = "/play";
  static const String rightAnswer = "/right_answer";
  static const String wrongAnswer = "/wrong_answer";
  static const String inputAnswer = "/input_answer";
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
      case RouteManager.rightAnswer:
        return MaterialPageRoute(builder: (_) => const RightAnswerScreen());
      case RouteManager.wrongAnswer:
        return MaterialPageRoute(builder: (_) => const WrongAnswerScreen());
      case RouteManager.inputAnswer:
        return MaterialPageRoute(builder: (_) => const InputAnswerScreen());
      default:
        return undefined();
    }
  }

  static Route<dynamic> undefined() {
    return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
