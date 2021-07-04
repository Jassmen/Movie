import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
     // maxLines:1,
        style:TextStyle(
            color:color,
            fontSize: textSize.sp,
            fontWeight: fontWeight
        ),
      overflow: TextOverflow.fade,
      maxLines: 6,

    );
  }
}