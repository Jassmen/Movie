import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app/home.dart';
import 'package:movie_app/movie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_sized_box.dart';
import 'build_text.dart';

class DetailScreen extends StatelessWidget {
  final Movie movie;
  DetailScreen(this.movie);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    movie.trailedId =movie.id.toString();
    return Scaffold(
        body: Stack(
      children: [
        appImage('https://image.tmdb.org/t/p/original${movie.poster}', size),
        moviePoster(size),
        detailsBody(context, size),
      ],
    ));
  }

  Widget detailsBody(BuildContext context, Size size) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AppSizedBox(
          height: 45.h,
        ),
        detailScreenToolBar(context),
        movieInfo(size),
        AppSizedBox(
          height: 15.h,
        ),
        buildToolbar(size, movie.title, Icons.bookmark, context, data: movie.date),
        movieVideo(size),
        overView('Overview'),
        overView(movie.overview, space: true, size: 12),
        overView('Cast', space: true),
        artistList(size)
      ]),
    );
  }

  Widget artistList(Size size) {
    return Container(
      height: 60.h,
      width: 1.sw,
      margin: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
      ),
 /*child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movie.artist.length,
          itemBuilder: (context, int index) {
            return Container(
                width: 60.w,
                height: 60.w,
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.w),
                    border: Border.all(color: Colors.white)),
                child: Image.asset(
                  movie.artist[index],
                  fit: BoxFit.cover,
                ));
          }),*/

    );
  }

  Widget overView(String text, {bool space = false, double size = 16}) {
    return Padding(
      padding: space
          ? EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.w)
          : EdgeInsets.all(20.w),
      child: AppText(
        text: text,
        textSize: size,
      ),
    );
  }

  Widget movieVideo(Size size) {
    return Container(
        height: .25.sh,
        width: 1.sw,
        margin: EdgeInsets.only(right: 20, left: 20),
        child: appImage('https://www.youtube.com/embed/${movie.trailedId}', size));//////////////////
  }

  Widget movieInfo(Size size) {
    return Container(
      margin: EdgeInsets.only(top:13.w),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: .2.sh,
              width: 110.w,
              margin: EdgeInsets.only(
                left: 20.w,
              ),
              child: appImage('https://image.tmdb.org/t/p/original${movie.poster}', size)),
          ),

          AppSizedBox(
            width: 10.w,
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(text: 'Featured Crew', textSize: 12),
                  AppSizedBox(
                    height: 10.h,
                  ),
                  AppText(
                    text: movie.title,///////////////////
                    fontWeight: FontWeight.bold,
                    textSize: 15.sp,
                  ),
                  AppText(
                    text: movie.title,//////////////////
                    textSize: 10.sp,
                  ),
                  AppSizedBox(
                    height: 10.h,
                  ),
                  AppText(
                    text: movie.title,//////////////////
                    fontWeight: FontWeight.bold,
                    textSize: 15.sp,
                  ),
                  AppText(
                    text: movie.title,//////////////////
                    textSize: 10.sp,
                  ),
                  AppSizedBox(
                    height: 10.h,
                  ),
 /*AppText(
                      text:
                          movie.movieType + '|' + movie.duration + '|' + movie.date,
                      color: Colors.white.withOpacity(.7),
                      textSize: 12.sp),*/

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget moviePoster(Size size) {
    return BackdropFilter(
      filter:ImageFilter.blur(
        sigmaX:12.0,
        sigmaY:12.0
      ),
      child: Container(
        height: (1 / 3).sh,
        width: 1.sw,
        child: appImage('https://image.tmdb.org/t/p/original${movie.backdrop}', size),
      ),
    );
  }

  Widget detailScreenToolBar(BuildContext context) {
    return BackdropFilter(
        filter:ImageFilter.blur(
        sigmaX:2.0,
        sigmaY:2.0
    ),
    child: Container(
      height: 70.h, // TODO: use screen util
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Row(
          children: [
            AppSizedBox(
              width: 20.w,
            ),
            Icon(
              Icons.arrow_back_ios,
              color: Colors.white.withOpacity(.7),
            ),
            AppText(
                text: 'Top Rated',
                color: Colors.white.withOpacity(.7),
                fontWeight: FontWeight.bold),
            Spacer(),
            AppText(
              text: movie.rate.toString(),
              textSize: 40.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            AppText(
              text: '/10',
              color: Colors.white.withOpacity(.7),
              textSize: 20.sp,
            ),
            AppSizedBox(
              width: 20.w,
            ),
          ],
        ),
      ),
    ));
  }
}
