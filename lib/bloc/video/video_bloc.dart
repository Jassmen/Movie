import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/video/video_event.dart';
import 'package:movie_app/bloc/video/video_state.dart';
import 'package:movie_app/services/fetchMovie.dart';

class VideoBloc extends Bloc<VideoEvent,VideoState>{
  VideoBloc() : super(VideoStateInitial());

  //Create Object from this Bloc
  static VideoBloc get(BuildContext context) =>BlocProvider.of(context);

  @override
  Stream<VideoState> mapEventToState(VideoEvent event) async* {
    if(event is VideoEventFetch) {
      yield* _fetchYouTubeId(event);
    }
  }

  Stream<VideoState> _fetchYouTubeId(VideoEventFetch event) async* {
    try{
        yield VideoStateLoading();

        String videoUrl = await fetchYouTubeId(event.id);

        yield VideoStateSuccess(videoUrl: videoUrl.toString());



    }catch(e){
      yield VideoStateFailed(error: e.toString());
    }
  }
}

