import 'package:dartz/dartz.dart';
import 'package:movies_riverpod/features/movie_detail/data/datasource/local/movie_detail_local_datasource.dart';
import 'package:movies_riverpod/features/movie_detail/data/datasource/remote/movie_detail_remote_datasource.dart';
import 'package:movies_riverpod/features/movie_detail/domain/repositories/movie_detail_repository.dart';
import 'package:movies_riverpod/models/movie_details/movie_detail.dart';
import 'package:movies_riverpod/models/response/casts_response.dart';
import 'package:movies_riverpod/core/util/app_exception.dart';




interface class MovieDetailRepoImpl extends MovieDetailRepository {
  final MovieDetailRemoteDataSource movieDetailDataSource;
  final MovieDetailLocalDataSource movieDetailLocalDataSource;

  MovieDetailRepoImpl(
      {required this.movieDetailDataSource,
      required this.movieDetailLocalDataSource});

  @override
  Future<Either<AppException, MovieDetail>> getMovie({required int id}) async {
    return movieDetailDataSource.getMovie(id: id);
  }

  @override
  Future<Either<AppException, CastsResponse>> getCasts({required int id}) {
    return movieDetailDataSource.getCasts(id: id);
  }

  @override
  Future<int> bookmarkMovieDetail(MovieDetail movieDetail) {
    return movieDetailLocalDataSource.bookmarkMovie(movieDetail);
  }

  @override
  Future<bool> removeBookmark(MovieDetail movieDetail) {
    return movieDetailLocalDataSource.removeBookmark(movieDetail);
  }

  @override
  Future<bool> isBookmarked(int id) {
    return movieDetailLocalDataSource.isBookmarked(id);
  }
}
