import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/screens/detail_screen.dart';
import 'package:movie_app/widgets/navigate_to.dart';

import 'app_image.dart';
import 'app_sized_box.dart';
import 'build_text.dart';

Widget searchedList(List<Movie> list) {
  return ListView.builder(
      itemCount: list.length > 5 ? 5 : list.length,
      itemBuilder: (context, index) {
        return listItem(list[index],context);
      });
}

Widget listItem(Movie index,context) {
  return InkWell(
    onTap: (){
      navigateTo(context,DetailScreen(index));
    },
    child: Container(
      child: Padding(
        padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 10.w),
        child: Row(
          children: [
            Container(
              height: .2.sh,
              width: 110.w,
              margin: EdgeInsets.only(
                left: 10.w,
              ),
              child: index.backdropPath != null ? appImage(index.backdropPath!) : Container(), ///////
            ),
            AppSizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: .5.sw,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: AppText(
                            text: index.title ?? '',
                            fontWeight: FontWeight.bold,
                            textSize: 12,
                          ),
                        ),
                        Spacer(),
                        AppText(
                          text: index.rating ?? '',
                          fontWeight: FontWeight.bold,
                          textSize: 12,
                        ),
                      ],
                    ),
                  ),
                  AppSizedBox(height: 10.h),
                  AppText(text: index.date ?? '', color: Colors.white.withOpacity(.7), textSize: 10),
                  AppSizedBox(height: 20.h),
                  AppText(text: index.overview ?? '', color: Colors.white.withOpacity(.7), textSize: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}