import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/artist/artist_bloc.dart';
import 'package:movie_app/bloc/artist/artist_event.dart';
import 'package:movie_app/bloc/video/video_bloc.dart';
import 'package:movie_app/bloc/video/video_event.dart';
import 'package:movie_app/model/movie_type.dart';
import 'package:movie_app/screens/home_screen.dart';
import 'package:movie_app/model/movie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/widgets/artistList.dart';
import 'package:movie_app/widgets/video.dart';

import '../widgets/app_sized_box.dart';
import '../widgets/build_text.dart';
import '../services/api_services.dart';

class DetailScreen extends StatelessWidget {
  final Movie movie;
  DetailScreen(this.movie);

  List<MovieType> movieTypeL = [];

  @override
  void initState() {
    movieType();
  }


  void movieType() async {
    final type = await fetchType(movie.id);
    print('type:--------------->$type');
    // setState(() {
    //   movieTypeL = type;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<VideoBloc>(create: (_) => VideoBloc()..add(VideoEventFetch(id: movie.id))),
        BlocProvider<ArtistBloc>(create: (_) => ArtistBloc()..add(ArtistEventFetch(id: movie.id))),
      ],
      child: Scaffold(
          body: Stack(
        children: [
          appImage(movie.poster),
          moviePoster(),
          detailsBody(
            context,
          ),
        ],
      )),
    );
  }

  Widget detailsBody(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AppSizedBox(height: 45.h),
      detailScreenToolBar(context),
      movieInfo(),
      AppSizedBox(height: 15.h),
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildToolbar(movie.title, Icons.bookmark, context, data: movie.date),
              MovieVideo(id: movie.id),
              overView('Overview'),
              overView(movie.overview, space: true, size: 12),
              overView('Cast', space: true),
              ArtistList(id: movie.id),
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

  Widget movieInfo() {
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
                child: appImage(movie.poster)),
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
                  AppText(text: 'Featured Crew', textSize: 12),
                  AppSizedBox(height: 10.h),
                  AppText(
                    text: movie.title, ///////////////////
                    fontWeight: FontWeight.bold,
                    textSize: 15.sp,
                  ),
                  AppText(
                    text: movie.title, //////////////////
                    textSize: 10.sp,
                  ),
                  AppSizedBox(height: 10.h),
                  AppText(
                    text: movie.title, //////////////////
                    fontWeight: FontWeight.bold,
                    textSize: 15.sp,
                  ),
                  AppText(
                    text: movie.title, //////////////////
                    textSize: 10.sp,
                  ),
                  AppSizedBox(height: 10.h),
                  /*  FutureBuilder<List<MovieType>>(
                      future: fetchType(movie.id),
                      builder: (context,snapshot){
                        if(snapshot.hasData) return AppText(
                          text:movieTypeL[0].type
                              +' | '+ movie.date,
                          textSize: 12.sp,
                        );
                        return AppText(
                          text:movie.date,
                          textSize: 12.sp,
                        );
                      }),*/
                  AppText(
                    text: movie.date,
                    textSize: 12.sp,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget moviePoster() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
      child: Container(
        height: (1 / 3).sh,
        width: 1.sw,
        child: appImage(movie.backdrop),
      ),
    );
  }

  Widget detailScreenToolBar(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
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
                AppText(text: 'Top Rated', color: Colors.white.withOpacity(.7), fontWeight: FontWeight.bold),
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
