import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movies/movies_event.dart';
import 'package:movie_app/bloc/movies/movies_state.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/services/api_services.dart';


class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesStateInitial());

  @override
  Stream<MoviesState> mapEventToState(MoviesEvent event) async* {
    if (event is MoviesEventFetch) {
      yield* _fetchMovies(event);
    }
  }

  Stream<MoviesState> _fetchMovies(MoviesEventFetch event) async* {
    // Fetcht movies and return States
    try {
      // return loading
      yield MoviesStateLoading();

      List<Movie> movies = await fetchMovie();
      // String  movies = await fetchYouTubeId(event.id);
      yield MoviesStateSuccess(list: movies);
    } catch (e) {
      yield MoviesStateFailed(error: e.toString());
    }
  }
}
