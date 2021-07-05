import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/widgets/index.dart';



class MovieInfo extends StatelessWidget {
  final Movie movie;
  MovieInfo({required this.movie});

  @override
  Widget build(BuildContext context) {
      return Container(
        margin: EdgeInsets.only(top: 13.w),
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
                  child: appImage(movie.poster!)),
            ),
            AppSizedBox(width: 10.w),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                       AppText(
                        text: movie.title ?? '',
                        textSize: 25.sp,
                      ),
                    AppSizedBox(height: 10.h),
                    AppText(text: 'Date:', textSize: 20.sp),
                    AppSizedBox(height: 10.h),
                    AppSizedBox(height: 10.h),
                    AppText(
                      text: movie.date ?? '',
                      textSize: 20.sp,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),

    );
  }
}