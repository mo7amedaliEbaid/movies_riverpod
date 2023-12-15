import 'package:dartz/dartz.dart';
import 'package:movies_riverpod/features/movies/data/datasource/local/movies_local_datasource.dart';
import 'package:movies_riverpod/features/movies/data/datasource/remote/movies_remote_data_source.dart';
import 'package:movies_riverpod/features/movies/domain/repositories/movies_repository.dart';
import 'package:movies_riverpod/models/movies/movies.dart';
import 'package:movies_riverpod/models/genres/genres.dart';
import 'package:movies_riverpod/models/movie/movie.dart';

import 'package:movies_riverpod/models/genre/genre.dart';

import '../../../../core/app/app_configs.dart';
import '../../../../core/util/app_exception.dart';

interface class MoviesRepoImpl extends MoviesRepository {
  final MoviesRemoteDataSource moviesRemoteDataSource;
  final MoviesLocalDataSource moviesLocalDataSource;

  MoviesRepoImpl({required this.moviesRemoteDataSource, required this.moviesLocalDataSource});

  @override
  Future<Either<AppException, Movies>> fetchAndCacheMovies(
      {required int page, required String type}) async {
    final response =
        await moviesRemoteDataSource.getMovies(endPoint: type, page: page);
    return response.fold((failure) => Left(failure), (success) {
      final listMovies = success.results.map((e) => Movie.fromJson(e)).toList();
      final Movies movies = Movies(
          movies: listMovies,
          page: success.page,
          type: type,
          totalPages: success.totalPages,
          totalResults: success.totalResults);
      if (movies.page <= AppConfigs.shouldCachePages) {
        moviesLocalDataSource.cacheMovies(
            movies: movies.copyWith(page: 0, cached: true)); // Cache Page 0
      }
      return Right(movies);
    });
  }

  @override
  Future<Either<AppException, Genres>> fetchAndCacheGenres() async {
    final response = await moviesRemoteDataSource.getGenre();
    return response.fold((failure) => Left(failure), (success) {
      final genres =
          Genres(genres: success.genres.map((e) => Genre.fromJson(e)).toList());
      moviesLocalDataSource.cacheGenres(genres: genres);
      return Right(genres);
    });
  }

  @override
  Future<Either<AppException, Genres>> fetchCachedGenres() {
    return moviesLocalDataSource.getGenreCache();
  }

  @override
  Future<Either<AppException, Movies>> fetchCachedMovies(
      {required String type}) {
    return moviesLocalDataSource.getCacheMovies(type: type);
  }
}
