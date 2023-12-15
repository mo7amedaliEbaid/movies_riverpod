import 'package:dartz/dartz.dart';
import 'package:movies_riverpod/models/movies/movies.dart';
import 'package:movies_riverpod/models/genres/genres.dart';

import '../../../../../core/util/app_exception.dart';

abstract class MoviesLocalDataSource {

  Future<void> cacheMovies({required Movies movies});

  Future<void> cacheGenres({required Genres genres});

  Future<Either<AppException, Movies>> getCacheMovies({required String type});

  Future<Either<AppException, Genres>> getGenreCache();
}
