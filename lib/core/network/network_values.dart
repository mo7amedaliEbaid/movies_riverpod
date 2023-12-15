sealed class EndPoints {
  static const String nowShowing = 'movie/now_playing';
  static const String upcoming = 'movie/upcoming';
  static const String popular = 'movie/top_rated';
  static const String trending = "trending/movie/week";
  static const String genre = 'genre/movie/list';


  static String movie(id) => 'movie/$id';

  static String searchMovie(query) => 'search/movie&query=$query';

  static String casts(int id) => '/movie/$id/credits';
}

sealed class Parameters {
  static const String page = 'page';
  static const String apiKey = 'api_key';
}
