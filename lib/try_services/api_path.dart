class ApiPath{
  static const _baseUrl = 'https://api.themoviedb.org/3';
  static const _apiKey = '?api_key=98b32984cf467bd24aba3f3bd5c7037c';
  static const _movie = '/movie';
  static const _videos = '/videos';
  static const _search = '/search';
  static const _sQuery = '&language=en-US&query=';
  static const _credit = '/credits';


  //will receive it ..
  static const selectedItem = '';
  static const id = '';
  static const movieName = '';


 static const getMovie = _baseUrl+_movie+selectedItem+_apiKey;
 static const getYouTube = _baseUrl+_movie+id+_videos+_apiKey;
 static const getCast = _baseUrl+_movie+id+_credit+_apiKey;
 static const getType = _baseUrl+_movie+id+_apiKey;
 static const getSearch = _baseUrl+_search+_movie+_apiKey+_sQuery+movieName;




}
