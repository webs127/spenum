import 'package:flutter/material.dart';
import 'package:spenum/app/app.dart';
import 'package:spenum/app/local_storage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceLocalStorage.getInstance();
  runApp( MyApp());
}
