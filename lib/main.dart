import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360,790),
      builder: ()=>MaterialApp(
        title: 'Movie App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.white ,
            iconTheme: IconThemeData(
                color: Colors.white
            ),
        ),
        home: Home(),
      ),
    );
  }
}

