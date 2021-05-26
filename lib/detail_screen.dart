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
    return Scaffold(
        body: Stack(
          children: [
            appImage(movie.imageBlur, size),
            moviePoster(size),
            detailsBody(context, size),
          ],
        ));
  }

  Widget detailsBody(BuildContext context, Size size) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AppSizedBox(height: 45.h,),
      detailScreenToolBar(context),
      movieInfo(size),
      AppSizedBox(height: 15.h,),
      buildToolbar(size, movie.name, Icons.bookmark, context,data: movie.year),
      movieVideo(size),
      overView('Overview'),
      overView(movie.description,space: true,size: 12),
      overView('Cast',space: true),
     artistList(size)


    ]);
  }

  Widget artistList(Size size) {
    return Container(
     height:60.h,
     width:size.width,
     margin:  EdgeInsets.only(left: 20, right: 20,),
     child: ListView.builder(
         scrollDirection: Axis.horizontal,
         itemCount: movie.artist.length,
         itemBuilder: (context,int index){
           return Container(
               width: 60.w,
               height: 50.h,
               padding: EdgeInsets.only(left: 10),
               child: CircleAvatar(child:Image.asset(movie.artist[index], fit: BoxFit.cover,)));
         }),
   );
  }

  Widget overView(String text, {bool space = false,double size= 16}) {
    return Padding(
      padding: space
          ? EdgeInsets.only(left: 20, right: 20,bottom: 10)
          : EdgeInsets.all(20),
      child: AppText(
        text: text,
        textSize: size,
      ),
    );
  }

  Widget movieVideo(Size size) {
    return Container(
        height: size.height / 4,
        width: size.width,
        margin: EdgeInsets.only(right: 20, left: 20),
        child: appImage(movie.video, size));
  }

  Widget movieInfo(Size size) {
    return Container(
      child: Row(
        children: [
          Container(
            height: size.height * .2 ,
            width: 110.w,
            margin: EdgeInsets.only(
              left: 20.w,
            ),
            child: appImage(movie.imageTop, size),
          ),
          AppSizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(text: 'Featured Crew', textSize: 12),
              AppSizedBox(
                height: 10.h,
              ),
              AppText(
                text: movie.writer,
                fontWeight: FontWeight.bold,
                textSize: 15.sp,
              ),
              AppText(
                text: movie.writerStates,
                textSize: 10.sp,
              ),
              AppSizedBox(
                height: 10.h,
              ),
              AppText(
                text: movie.director,
                fontWeight: FontWeight.bold,
                textSize: 15.sp,
              ),
              AppText(
                text: movie.directorStates,
                textSize: 10.sp,
              ),
              AppSizedBox(
                height: 10.h,
              ),
              AppText(
                  text:
                      movie.movieType + '|' + movie.duration + '|' + movie.date,
                  color: Colors.white.withOpacity(.7),
                  textSize: 12.sp),
            ],
          ),
        ],
      ),
    );
  }

  Widget moviePoster(Size size) {
    return Container(
      height: size.height / 3,
      width: size.width,
      child: appImage(movie.movieImage, size),
    );
  }

  Widget detailScreenToolBar(BuildContext context) {
    return Container(
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
    );
  }


}
