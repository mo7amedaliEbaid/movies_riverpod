import 'package:dartz/dartz.dart';
import 'package:movies_riverpod/app/app_configs.dart';
import 'package:movies_riverpod/features/movies/data/datasource/local/home_local_datasource.dart';
import 'package:movies_riverpod/features/movies/data/datasource/remote/home_remote_data_source.dart';
import 'package:movies_riverpod/features/movies/domain/repositories/home_repository.dart';
import 'package:movies_riverpod/models/movies/movies.dart';
import 'package:movies_riverpod/models/genres/genres.dart';
import 'package:movies_riverpod/models/movie/movie.dart';
import 'package:movies_riverpod/shared/util/app_exception.dart';

import 'package:movies_riverpod/models/genre/genre.dart';

interface class HomeRepoImpl extends HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource, required this.homeLocalDataSource});

  @override
  Future<Either<AppException, Movies>> fetchAndCacheMovies(
      {required int page, required String type}) async {
    final response =
        await homeRemoteDataSource.getMovies(endPoint: type, page: page);
    return response.fold((failure) => Left(failure), (success) {
      final listMovies = success.results.map((e) => Movie.fromJson(e)).toList();
      final Movies movies = Movies(
          movies: listMovies,
          page: success.page,
          type: type,
          totalPages: success.totalPages,
          totalResults: success.totalResults);
      if (movies.page <= AppConfigs.shouldCachePages) {
        homeLocalDataSource.cacheMovies(
            movies: movies.copyWith(page: 0, cached: true)); // Cache Page 0
      }
      return Right(movies);
    });
  }

  @override
  Future<Either<AppException, Genres>> fetchAndCacheGenres() async {
    final response = await homeRemoteDataSource.getGenre();
    return response.fold((failure) => Left(failure), (success) {
      final genres =
          Genres(genres: success.genres.map((e) => Genre.fromJson(e)).toList());
      homeLocalDataSource.cacheGenres(genres: genres);
      return Right(genres);
    });
  }

  @override
  Future<Either<AppException, Genres>> fetchCachedGenres() {
    return homeLocalDataSource.getGenreCache();
  }

  @override
  Future<Either<AppException, Movies>> fetchCachedMovies(
      {required String type}) {
    return homeLocalDataSource.getCacheMovies(type: type);
  }
}
