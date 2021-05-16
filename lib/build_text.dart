import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color color;
  final double textSize;
  final FontWeight fontWeight;

  const AppText({
    this.text ='',
    this.color = Colors.white
    , this.textSize = 16
    , this.fontWeight =   FontWeight.normal
  }) ;

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style:TextStyle(
            color:color,
            fontSize: textSize,
            fontWeight: fontWeight


        ));
  }
}