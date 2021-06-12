import 'package:flutter/material.dart';
import 'package:movie_app/services/fetchMovie.dart';
import 'package:movie_app/screens/home_screen.dart';
import '../movie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<CastData> castList=[];
Widget artistList(int id) {
  return FutureBuilder<List<CastData>>(
      future: fetchCastDATA(id),
      builder: (context,snapshot){
        if(snapshot.hasData) return ArtistList(snapshot);
        return buildProgressWidget();
      });

}

Widget ArtistList(AsyncSnapshot<List<CastData>> snapshot) {
  castList = snapshot.data ?? [];
  return Container(
    height: 60.h,
    width: 1.sw,
    margin: EdgeInsets.only(
      left: 20.w,
      right: 20.w,
    ),
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: castList.length > 10 ? 10 : castList.length,
        itemBuilder: (context, int index) {
          return Container(
              width: 60.w,
              height: 60.w,
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.w),
                  border: Border.all(color: Colors.white)),
              child: appImage(castList[index].profilePath));
        }),
  );
}
