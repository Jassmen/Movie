import 'package:bloc/bloc.dart';
import 'package:movie_app/bloc/artist/artist_event.dart';
import 'package:movie_app/bloc/artist/artist_state.dart';
import 'package:movie_app/movie.dart';
import 'package:movie_app/services/fetchMovie.dart';

class ArtistBloc extends Bloc<ArtistEvent, ArtistState>{
  ArtistBloc() : super(ArtistStateInit());

  @override
  Stream<ArtistState> mapEventToState(ArtistEvent event) async* {
  if(event is ArtistEventFetch){
    yield* _fetchArtistList(event);
    }

  }

  Stream<ArtistState> _fetchArtistList(ArtistEventFetch event) async*{
    try{
      yield ArtistStateLoading();

      List<CastData> cast = await fetchCastDATA(event.id);
      yield ArtistStateSuccess(list: cast);
    }catch(e){
      yield ArtistStateFailed(e: e.toString());
    }


  }

}