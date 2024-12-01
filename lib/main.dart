import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spenum/app/app.dart';
import 'package:spenum/app/local_storage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  await SharedPreferenceLocalStorage.getInstance();
  runApp( MyApp());
}
