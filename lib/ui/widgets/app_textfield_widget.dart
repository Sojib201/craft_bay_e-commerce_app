import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AppTextFieldWidget extends StatelessWidget {
  const AppTextFieldWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,  this.Maxlines,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final int? Maxlines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: Maxlines ?? 1,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor),
        ),
      ),
    );
  }
}
