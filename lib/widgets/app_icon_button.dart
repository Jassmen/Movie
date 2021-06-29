import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  var press;
  final IconData icon;
  final Color color;
  AppIconButton({required this.press,required this.icon,this.color =Colors.white});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed:press,
        icon: Icon(icon,
          color: color,
        ));
  }
}