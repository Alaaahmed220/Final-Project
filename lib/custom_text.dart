import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final TextEditingController? Controller;
  final String? hintText;
  final String? label;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? KeyboardType;
  final bool? obscureText;
  CustomText({super.key,this.hintText,this.label,this.Controller,this.validator,this.prefixIcon,this.suffixIcon,this.KeyboardType,this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: Controller ,
        validator: validator ,
        keyboardType:KeyboardType,
        obscureText:obscureText?? false ,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText??'Type...',
          label: Text(label??''),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),

        );
    }
}