import 'package:flutter/cupertino.dart';

class AppSizedBox extends StatelessWidget {
  final double height;
  final double width;


  const AppSizedBox({
    this.height= 0.0,
    this.width= 0.0,

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}