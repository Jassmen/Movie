import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/screens/search_screen.dart';
import 'package:movie_app/widgets/app_sized_box.dart';
import 'package:movie_app/widgets/build_text.dart';

String moveName = 'play';

void getMovieName(String name) {
  moveName = name;
  print('movieName--------------------------------$moveName');
}

class SearchScreen1 extends StatelessWidget {
  bool notFound ;
  SearchScreen1({this.notFound = false});

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: iconColor.withOpacity(.3),
      body:buildBody(context)
    );
  }

  Padding buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w, left: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSizedBox(height: 70.h),
          buildAppBar(context),
          notFound ? AppSizedBox(height: .3.sh): SizedBox(),
          notFound ? Center(
            child: AppText(text: 'Not Found',),
          ):SizedBox()

        ],
      ),
    );
  }


}
Container buildAppBar(BuildContext context) {
  return Container(
    width: 1.sw,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Color(0xFF191919).withOpacity(.5),
    ),
    child: TextField(
      cursorColor: Colors.white,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: 'search...',
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(.5),
          ),
          prefixIcon: IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder:
                    (context)=> SearchScreen(nameOfMovie: '$moveName',)));
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
              )),
          suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.mic,
                color: iconColor,
              ))),
      onChanged: (value) => getMovieName(value.toString()),


    ),
  );
}