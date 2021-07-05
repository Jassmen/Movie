import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'index.dart';

Widget detailToolbar({required String text}) {
  return Container(
    margin: EdgeInsets.only(bottom: 10.w),
    child: InkWell(
      onTap: () {},
      child: Row(
        children: [
          AppSizedBox(width: 40.w),
          Expanded(flex: 9,
              child: AppText(
                  text: text,
                  color: Colors.white,
                  textSize: 25.sp,
                  fontWeight: FontWeight.bold)),

          Spacer(),
          AppIconButton(press: (){}, icon:  Icons.bookmark),

          AppSizedBox(width: 20.w),
        ],
      ),
    ),
  );
}