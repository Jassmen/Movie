
import 'package:flutter/material.dart';
import 'package:movie_app/screens/search_screen.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'index.dart';


Widget buildToolbar(String text, IconData icon, BuildContext context,) {
  return Container(
    margin: EdgeInsets.only(bottom: 10.w),
    child: Row(
      children: [
        AppSizedBox(width: 40.w),
        AppText(text: text, color: Colors.white, textSize: 25.sp, fontWeight: FontWeight.bold),
        PopupMenuButton<int>(
            icon:Icon(Icons.arrow_drop_down_rounded) ,
            color:Colors.black38 ,
            itemBuilder: (context)=>[
              appPopupMenuItem(v:0,text: 'Popular'),
              appPopupMenuItem(v: 1,text: 'Top Rated'),
              appPopupMenuItem(v:2,text: 'Now Playing'),
              appPopupMenuItem(v:3,text: 'Upcoming'),
            ]),
        Spacer(),
        AppIconButton(
            press: ()=>navigateTo(context,SearchScreen()) ,
            icon: Icons.search),
        AppSizedBox(width: 20.w),
      ],
    ),
  );
}




PopupMenuItem<int> appPopupMenuItem({required int v,required String text}) =>
    PopupMenuItem(value:v,child: AppText(text: text));