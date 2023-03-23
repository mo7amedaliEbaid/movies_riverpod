sealed class AppConfigs {

  static String preMovieBackdrop(String path) =>
      'https://image.tmdb.org/t/p/w780$path';

  static String preMoviePoster(String path) =>
      'https://image.tmdb.org/t/p/w500$path';

  static String preCastProfilePath(String path) =>
      'https://image.tmdb.org/t/p/w185$path';

  static const int shouldCachePages = 1;
}
