import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/bloc/video/video_bloc.dart';
import 'package:movie_app/bloc/video/video_event.dart';
import 'package:movie_app/bloc/video/video_state.dart';
import 'package:movie_app/services/fetchMovie.dart';
import 'package:movie_app/screens/home_screen.dart';
import 'package:movie_app/widgets/build_text.dart';
import 'package:url_launcher/url_launcher.dart';



void launchURL() async => await canLaunch('https://www.youtube.com/embed/$trailingId')
    ? await launch('https://www.youtube.com/embed/$trailingId')
    : throw 'Could not launch ' + 'https://www.youtube.com/embed/$trailingId';

String trailingId='';

Widget movieVideo(int id,BuildContext context,VideoBloc videoBloc) {
  return BlocProvider(
    create: (_)=>videoBloc,
    child:buildBody(id),

  );
}

Widget buildBody(int id) {

  return BlocBuilder<VideoBloc,VideoState>(builder: (context,state){

    if(state is VideoStateSuccess) {
        trailingId =state.videoUrl;
        return appVideoContainer();
      }
    if(state is VideoStateFailed) {
      return Center(child: AppText(text:'Error',));
      }
    return videoProgressContainer();
    },
  );
}

Container videoProgressContainer() {
  return Container(
      height: .25.sh,
      width: 1.sw,
      color: Colors.black,
      margin: EdgeInsets.only(right: 20.w, left: 20.w),
      child:buildProgressWidget());
}

Container appVideoContainer() {
  return Container(
    height: .25.sh,
    width: 1.sw,
    color: Colors.black,
    margin: EdgeInsets.only(right: 20.w, left: 20.w),
    child: Center(
      child: IconButton(
        onPressed: launchURL,
        icon: Icon(Icons.play_circle_outline_outlined, size: 30),
      ),
    ),
  );
}