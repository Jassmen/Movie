import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/artist/index.dart';
import 'package:movie_app/bloc/video/index.dart';
import 'package:movie_app/model/movie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/widgets/index.dart';


class DetailScreen extends StatelessWidget {
  final Movie movie;
  DetailScreen(this.movie);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<VideoBloc>(create: (_) => VideoBloc()..add(VideoEventFetch(id: movie.id!))),
        BlocProvider<ArtistBloc>(create: (_) => ArtistBloc()..add(ArtistEventFetch(id: movie.id!))),
      ],
      child: Scaffold(
          body: Stack(
            children: [
              appImage(movie.poster!),
              moviePoster(),
              detailsBody(context),
            ],
          )),
    );
  }

  Widget detailsBody(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AppSizedBox(height: 45.h),
      detailScreenToolBar(context),
      MovieInfo(movie: movie),
      AppSizedBox(height: 15.h),
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              detailToolbar(text: movie.title ?? ''),
              MovieVideo(id: movie.id!),
              overView('Overview'),
              overView(movie.overview ?? '', space: true, size: 12),
              overView('Cast', space: true),
              ArtistList(id: movie.id!),
              AppSizedBox(height: 10.h),
            ],
          ),
        ),
      )
    ]);
  }

  Widget overView(String text, {bool space = false, double size = 16}) {
    return Padding(
      padding: space ? EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.w) : EdgeInsets.all(20.w),
      child: AppText(
        text: text,
        textSize: size,
      ),
    );
  }



  Widget moviePoster() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
      child: Container(
        height: (1 / 3).sh,
        width: 1.sw,
        child: appImage(movie.backdropPath!),
      ),
    );
  }

  Widget detailScreenToolBar(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: Container(
          height: 70.h,
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
                AppText(text: 'Top Rated', color: Colors.white.withOpacity(.7), fontWeight: FontWeight.bold),
                Spacer(),
                AppText(
                  text: movie.rating.toString(),
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