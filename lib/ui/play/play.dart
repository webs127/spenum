import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:spenum/app/route.dart';
import 'package:spenum/core/color_manager.dart';
import 'package:spenum/core/textstyle_manager.dart';
import 'package:spenum/services/random_number_generator_viewmodel.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  late RandomNumberGeneratorViewmodel _randomNumberGeneratorViewmodel;
  bool isGenerationComplete = false;

  @override
  void initState() {
    super.initState();
    _randomNumberGeneratorViewmodel = RandomNumberGeneratorViewmodel();
    _randomNumberGeneratorViewmodel.generationCompleteStream.listen((_) {
      setState(() {
        isGenerationComplete = true;
      });
      //showBottomSheet();
    });
  }

  @override
  void dispose() {
    _randomNumberGeneratorViewmodel.dispose();
    super.dispose();
  }

  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController submit = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [ColorManager.blue, ColorManager.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder<int>(
                    stream: _randomNumberGeneratorViewmodel.randomNumberStream,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text("Error:  + ${snapshot.error}");
                      } else if (!snapshot.hasData) {
                        return const Text("No Data");
                      } else {
                        log("${snapshot.data}");
                        return Text(
                          "${snapshot.data}",
                          style: italicTextStyle(
                            fontSize: 40.sp,
                            color: ColorManager.white,
                            fontStyle: FontStyle.italic,
                          ),
                        );
                      }
                    }),
                SizedBox(height: 20.h),
                if (isGenerationComplete)
                  StreamBuilder<String>(
                      stream: _randomNumberGeneratorViewmodel
                          .concatenatedStringStream,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text("Error:  + ${snapshot.error}");
                        } else if (!snapshot.hasData) {
                          return const Text("No Data");
                        } else {
                          print(snapshot.data);
                          return ElevatedButton(
                            onPressed: () {
                              showBottomSheet(snapshot.data);
                              // _showAlertDialog();
                            },
                            child: const Text('Enter Final String'),
                          );
                        }
                      }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showBottomSheet(String? answer) {
    print("object: $answer");
    showModalBottomSheet(
      context: context,
      //isDismissible: false,
      builder: (context) {
        return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
                key: key,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Enter the final string:',
                        style: italicTextStyle(
                            fontSize: 20.sp, fontStyle: FontStyle.italic)),
                    TextFormField(
                      controller: submit,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (key.currentState!.validate()) {
                          Navigator.of(context).pop();
                          _showAlertDialog(answer == submit.text);
                        }
                        else {
                          print("Empty String");
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                )));
      },
    );
  }

  void _showAlertDialog(bool correct) {
    print(correct);
    showDialog(
        //barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: Container(
                color: Colors.white,
                width: 200.w,
                height: 200.w,
                child: FittedBox(
                  child: SizedBox(
                    width: 30.w,
                    height: 30.w,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: correct ?Colors.green : Colors.red,
                          borderRadius: BorderRadius.circular(100.r)),
                      child: Center(
                        child: Icon(
                          correct ? IcoFontIcons.tickMark : Icons.cancel_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              contentPadding: EdgeInsets.only(
                  top: 20.h, bottom: 20.h, left: 10.h, right: 10.h),
              titlePadding: EdgeInsets.only(left: 50.w, right: 50.w, top: 10.h),
              contentTextStyle: regularTextStyle(
                  fontSize: 20.sp,
                  color: ColorManager.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600),
              content: Text( correct ? 
                "You got it right \n Would you like to play again?" : "You got it wrong \n Would you like to play again?",
                textAlign: TextAlign.center,
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushReplacementNamed(context, RouteManager.play);
                  },
                  child: const Text('Yes'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushReplacementNamed(
                        context, RouteManager.landing);
                  },
                  child: const Text('No'),
                ),
              ],
              actionsAlignment: MainAxisAlignment.center,
            ));
  }
}
