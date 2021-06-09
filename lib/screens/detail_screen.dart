import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:movie_app/screens/home_screen.dart';
import 'package:movie_app/movie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import '../app_sized_box.dart';
import '../build_text.dart';
import '../model/fetchMovie.dart';

class DetailScreen extends StatefulWidget {
  final Movie movie;
  //final int index;
  //DetailScreen(this.movie, this.index);
  DetailScreen(this.movie);
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String trailingId = '';
  List<CastData> castList = [];
  List<MovieType> movieTypeL = [];
  late VideoPlayerController controller;

  @override
  void initState() {
    youtubeUrl();
    castListUrl();
    clearCache();
    movieType();
  }

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }

  void youtubeUrl() async {
    print(widget.movie.id);
    final youtubeId = await fetchYouTubeId(widget.movie.id);
    print(youtubeId);
    setState(() {
      trailingId = youtubeId;
    });
  }

  void _launchURL() async => await canLaunch('https://www.youtube.com/embed/$trailingId')
      ? await launch('https://www.youtube.com/embed/$trailingId')
      : throw 'Could not launch ' + 'https://www.youtube.com/embed/$trailingId';

  void castListUrl() async {
    final crew = await fetchCastDATA(widget.movie.id);
    print(crew);
    setState(() {
      castList = crew;
    });
  }

  void clearCache() {
    DefaultCacheManager().emptyCache();
    imageCache!.clear();
    imageCache!.clearLiveImages();
    setState(() {});
  }

  void movieType() async {
    final type = await fetchType(widget.movie.id);
    print('type:--------------->$type');
    setState(() {
      movieTypeL = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        appImage(widget.movie.poster),
        moviePoster(),
        detailsBody(
          context,
        ),
      ],
    ));
  }

  Widget detailsBody(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AppSizedBox(
        height: 45.h,
      ),
      detailScreenToolBar(context),
      movieInfo(),
      AppSizedBox(
        height: 15.h,
      ),
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildToolbar(widget.movie.title, Icons.bookmark, context, data: widget.movie.date),
              movieVideo(),
              overView('Overview'),
              overView(widget.movie.overview, space: true, size: 12),
              overView('Cast', space: true),
              artistList(),
              AppSizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      )
    ]);
  }

  Widget artistList() {
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
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.w), border: Border.all(color: Colors.white)),
                child: appImage(castList[index].profilePath));
          }),
    );
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

  Widget movieVideo() {
    return Container(
      height: .25.sh,
      width: 1.sw,
      color: Colors.black,
      margin: EdgeInsets.only(right: 20.w, left: 20.w),
      child: Center(
        child: IconButton(
          onPressed: _launchURL,
          icon: Icon(Icons.play_circle_outline_outlined, size: 30),
        ),
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
                child: appImage(widget.movie.poster)),
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
                    text: widget.movie.title, ///////////////////
                    fontWeight: FontWeight.bold,
                    textSize: 15.sp,
                  ),
                  AppText(
                    text: widget.movie.title, //////////////////
                    textSize: 10.sp,
                  ),
                  AppSizedBox(
                    height: 10.h,
                  ),
                  AppText(
                    text: widget.movie.title, //////////////////
                    fontWeight: FontWeight.bold,
                    textSize: 15.sp,
                  ),
                  AppText(
                    text: widget.movie.title, //////////////////
                    textSize: 10.sp,
                  ),
                  AppSizedBox(
                    height: 10.h,
                  ),
                  /*AppText(
                    text:movieTypeL[widget.index].type
                    +' | '+ widget.movie.date,
                    textSize: 12.sp,
                  )*/
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
        child: appImage(widget.movie.backdrop),
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
                  text: widget.movie.rate.toString(),
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