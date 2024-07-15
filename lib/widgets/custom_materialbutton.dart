
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spenum/core/textstyle_manager.dart';

class CustomMaterialButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const CustomMaterialButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 10,
      onPressed: onPressed,
      minWidth: 129,
      height: 52,
      color: Colors.white,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(26)),
      child: Text(title,
          style: italicTextStyle(fontSize: 20.sp, fontStyle: FontStyle.italic)),
    );
  }
}
