import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class RandomNumberGeneratorViewmodel extends ChangeNotifier {
  final Random _random = Random();
  int _length = 5;
  final FlutterTts _flutterTts = FlutterTts();
  final _randomNumberStreamController = StreamController<int>();
  final _concatenatedStringController = StreamController<String>();
  final _generationCompleteController = StreamController<void>();

  String concatenatedNumbers = '';

  Stream<int> get randomNumberStream => _randomNumberStreamController.stream; //stream for listening of random number
  Stream<String> get concatenatedStringStream => _concatenatedStringController.stream; //stream for listening of concatenated string of the numbers generated
  Stream<void> get generationCompleteStream => _generationCompleteController.stream; //stream for listening if generation of numbers is complete

  RandomNumberGeneratorViewmodel() {
    _startGeneratingNumbers();
  }

  set length(int value) {
    _length = value;
    notifyListeners();
  }

  int get length => _length;

//Functon for generating single numbers, concatenating the generated numbers in string format
  void _startGeneratingNumbers() async {
    for (int i = 0; i < _length; i++) {
      await Future.delayed(const Duration(seconds: 1));
      int newNumber = _random.nextInt(10); // Generate single-digit numbers
      _randomNumberStreamController.add(newNumber);
      concatenatedNumbers += newNumber.toString();
      _concatenatedStringController.add(concatenatedNumbers);
      await _flutterTts.speak(newNumber.toString());
    }
    _randomNumberStreamController.close();
    _concatenatedStringController.close();
    _generationCompleteController.add(null);
    _generationCompleteController.close();
  }

  @override
  void dispose() {
    _randomNumberStreamController.close();
    _concatenatedStringController.close();
    _generationCompleteController.close();
    super.dispose();
  }
}
