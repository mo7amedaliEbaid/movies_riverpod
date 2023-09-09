import 'package:dartz/dartz.dart';
import 'package:movies_riverpod/models/domain/movies.dart';
import 'package:movies_riverpod/models/genres.dart';
import 'package:movies_riverpod/shared/util/app_exception.dart';

abstract class HomeLocalDataSource {

  Future<void> cacheMovies({required Movies movies});

  Future<void> cacheGenres({required Genres genres});

  Future<Either<AppException, Movies>> getCacheMovies({required String type});

  Future<Either<AppException, Genres>> getGenreCache();
}
