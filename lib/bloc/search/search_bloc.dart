import 'package:bloc/bloc.dart';
import 'package:movie_app/bloc/search/search_event.dart';
import 'package:movie_app/bloc/search/search_state.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/services/api_services.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchStateInit());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchEventFetch) {
      yield* _fetchSearchList(event);
    }
  }

  Stream<SearchState> _fetchSearchList(SearchEventFetch event) async* {
    try {
      yield SearchStateLoading();

      List<Movie> list = await fetchSearch(event.movieName);
      yield SearchStateSuccess(list: list);
    } catch (e) {
      yield SearchStateFailed(error: e.toString());
    }
  }
}
