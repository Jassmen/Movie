import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppTextField extends StatelessWidget {
  final String hint;
  final String? label;
  final Widget? suffix;
  final Widget? prefix;
  final Color cursorColor;
  final Color textColor;
  final Color hintTextColor;
  final TextEditingController? controller;
  final Function(String)? onSaved;
  final Function(String)? onChange;
  final InputDecoration? decoration;


   AppTextField({
      required this.hint,
      this.label = '',
      this.suffix,
      this.prefix,
      this.controller,
      this.onSaved,
      this.onChange,
      this.decoration,
      this.cursorColor=Colors.white,
      this.textColor=Colors.white,
      this.hintTextColor= Colors.white});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChange,
      cursorColor: cursorColor,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(color: Colors.white),
      textInputAction:TextInputAction.done,
      decoration: decoration ?? InputDecoration(
        hintText: hint,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        suffixIcon:suffix,
        prefixIcon: prefix,
        contentPadding: EdgeInsets.all(5.w),
        isDense: true,
        alignLabelWithHint: true,
        hintStyle: TextStyle(color:hintTextColor.withOpacity(.5)),)
      );



  }
}
