import 'package:dartz/dartz.dart';
import 'package:movies_riverpod/models/movie_details/movie_detail.dart';

import '../../../../../core/util/app_exception.dart';

abstract class BookmarkLocalDataSource {
  Future<Either<AppException, List<MovieDetail>>> getBookMarkMovies();
  Future<void> removeBookMark(MovieDetail movieDetail);
}
