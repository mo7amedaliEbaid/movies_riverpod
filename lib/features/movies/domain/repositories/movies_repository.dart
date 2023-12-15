import 'package:dartz/dartz.dart';
import 'package:movies_riverpod/models/movies/movies.dart';
import 'package:movies_riverpod/models/genres/genres.dart';

import '../../../../core/util/app_exception.dart';

abstract class MoviesRepository {
  Future<Either<AppException, Movies>> fetchAndCacheMovies(
      {required int page, required String type});

  Future<Either<AppException, Genres>> fetchAndCacheGenres();

  Future<Either<AppException, Genres>> fetchCachedGenres();

  Future<Either<AppException, Movies>> fetchCachedMovies(
      {required String type});
}
