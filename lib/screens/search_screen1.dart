import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/screens/search_screen.dart';
import 'package:movie_app/widgets/app_icon_button.dart';
import 'package:movie_app/widgets/app_sized_box.dart';
import 'package:movie_app/widgets/build_text.dart';

String moveName = 'play';

void getMovieName(String name,BuildContext context) {
  moveName = name;
  print('movieName--------------------------------$moveName');
  Navigator.pop(context);
  Navigator.push(context, MaterialPageRoute(builder:
      (context)=> SearchScreen(nameOfMovie: '$moveName',)));
}

class SearchScreen1 extends StatelessWidget {
  bool notFound ;
  SearchScreen1({this.notFound = false});
  final searchController = TextEditingController();


    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
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
          buildAppBar(context,searchController),
          notFound ? AppSizedBox(height: .3.sh): SizedBox(),
          notFound ? Center(
            child: AppText(text: 'Not Found',),
          ):SizedBox()

        ],
      ),
    );
  }


}
Container buildAppBar(BuildContext context, TextEditingController searchController) {
  return Container(
    width: 1.sw,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Color(0xFF191919).withOpacity(.5),
    ),
    child: TextField(
      controller: searchController,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      textInputAction:TextInputAction.done,
      decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: 'search...',
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(.5)),
          prefixIcon: AppIconButton(
            icon: Icons.search,
            press:  () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder:
                (context)=> SearchScreen(nameOfMovie: '$moveName',)));
          },),
          suffixIcon:searchController.text.isEmpty ? Container(width: 0):
          AppIconButton(icon:Icons.close,
                  press: () => searchController.clear()),
      ),
      //onChanged: (value) => getMovieName(value.toString()),
      onSubmitted:(value) => getMovieName(value.toString(),context) ,


    ),
  );
}

