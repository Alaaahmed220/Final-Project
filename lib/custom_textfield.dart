import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final double? sizeText;
  final Color? colorText;
  const CustomTextField({super.key,required this.text,this.colorText,this.sizeText});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontSize: sizeText?? 18,fontWeight: FontWeight.bold,color: colorText?? Colors.black87),);
    }
}