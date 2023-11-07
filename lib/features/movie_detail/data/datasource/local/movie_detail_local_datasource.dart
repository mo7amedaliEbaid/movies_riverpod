import 'package:movies_riverpod/models/movie_details/movie_detail.dart';

abstract class MovieDetailLocalDataSource {
  Future<int> bookmarkMovie(MovieDetail movieDetail);

  Future<bool> removeBookmark(MovieDetail movieDetail);

  Future<bool> isBookmarked(int id);
}
