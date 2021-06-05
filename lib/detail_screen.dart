import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app/home.dart';
import 'package:movie_app/movie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';


import 'app_sized_box.dart';
import 'build_text.dart';
import 'model/fetchMovie.dart';

class DetailScreen extends StatefulWidget {
  final Movie movie;
  DetailScreen(this.movie);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String trailingId ='';
  List<CastData> castList=[];
  late VideoPlayerController controller ;
  late Future<void> initializeVideoPlayerFuture;

  @override
  void initState() {
    youtubeUrl();
   castListUrl();
    controller = VideoPlayerController.network('https://www.youtube.com/embed/$trailingId');
    initializeVideoPlayerFuture = controller.initialize();
    controller.setVolume(1.0);
    controller.addListener(() { });


  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void youtubeUrl()  async {
    print(widget.movie.id);
    final youtubeId = await fetchYouTubeId(widget.movie.id);
    print(youtubeId);
    setState(() {
      trailingId = youtubeId;
    });


  }



  void castListUrl() async{
    final crew = await fetchCastDATA(widget.movie.id);
    print(crew);
    setState(() {
      castList = crew;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
          children: [
            appImage(widget.movie.poster, size),
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
        buildToolbar(size, widget.movie.title, Icons.bookmark, context, data: widget.movie.date),
        movieVideo(size),
        overView('Overview'),
        overView(widget.movie.overview, space: true, size: 12),
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
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: castList.length,
          itemBuilder: (context, int index) {
            return Container(
                width: 60.w,
                height: 60.w,
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.w),
                    border: Border.all(color: Colors.white)),
                child: appImage(castList[index].profilePath, size));
          }),
   /*   child:FutureBuilder<List<CastData>>(
        future: fetchCast(widget.movie.id),
        builder:(context,snapshot){
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? castList(snapshot.data)
              : Center(child: CircularProgressIndicator());


        }
      )*/

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
      margin: EdgeInsets.only(right: 20.w, left: 20.w),
       child: FutureBuilder(
         future: initializeVideoPlayerFuture,
         builder: (context,snapshot){
           if( snapshot.connectionState == ConnectionState.done){
             return Stack(
               children: [
                 AspectRatio(
                     aspectRatio: controller.value.aspectRatio,
                   child: VideoPlayer(controller),
                 ),
                 Center(
                   child: IconButton(
                     onPressed: (){
                       setState(() {
                         controller.value.isPlaying?
                             controller.pause(): controller.play();
                       });
                     },
                     icon: Icon(Icons.play_circle_outline_outlined),
                   ),
                 )
               ],
             );
           }else{
             return Center(
               child: CircularProgressIndicator(),
             );
           }
         },
       )
    );
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
                child: appImage(widget.movie.poster, size)),
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
                    text: widget.movie.title,///////////////////
                    fontWeight: FontWeight.bold,
                    textSize: 15.sp,
                  ),
                  AppText(
                    text: widget.movie.title,//////////////////
                    textSize: 10.sp,
                  ),
                  AppSizedBox(
                    height: 10.h,
                  ),
                  AppText(
                    text: widget.movie.title,//////////////////
                    fontWeight: FontWeight.bold,
                    textSize: 15.sp,
                  ),
                  AppText(
                    text: widget.movie.title,//////////////////
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
        child: appImage(widget.movie.backdrop, size),
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



