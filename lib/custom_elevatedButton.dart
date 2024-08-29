import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomElevated extends StatelessWidget {
  final Color? backgroundColor;
  final double? borderRadius;
  final String textButton;
  final Color? colorText;
  void Function() onPressed;

  CustomElevated(
      {super.key,
      this.backgroundColor,
      this.borderRadius,
      required this.onPressed,
      required this.textButton,
      this.colorText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? Colors.grey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 15))),
        child: Text(
          textButton,
          style: TextStyle(fontSize: 20, color: colorText ?? Colors.black),
        ));
  }
}
