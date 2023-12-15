import 'package:dartz/dartz.dart';
import 'package:movies_riverpod/models/response/genre_response.dart';
import 'package:movies_riverpod/models/response/movies_response.dart';

import '../../../../../core/util/app_exception.dart';

abstract class MoviesRemoteDataSource {
  Future<Either<AppException, MoviesResponse>> getMovies(
      {required String endPoint, required int page});

  Future<Either<AppException, MoviesResponse>> getSearchedMovies(
      {required String query, required int page});

  Future<Either<AppException, GenreResponse>> getGenre();
}
