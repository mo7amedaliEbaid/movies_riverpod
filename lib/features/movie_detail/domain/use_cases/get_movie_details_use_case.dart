import 'package:dartz/dartz.dart';
import 'package:movies_riverpod/features/movie_detail/domain/repositories/movie_detail_repository.dart';
import 'package:movies_riverpod/models/movie_details/movie_detail.dart';

import '../../../../core/util/app_exception.dart';

interface class GetMovieDetailsUseCase {
  final MovieDetailRepository movieDetailRepository;

  GetMovieDetailsUseCase({required this.movieDetailRepository});

  Future<Either<AppException, MovieDetail>> execute(
      {required int movieId}) async {
    return movieDetailRepository.getMovie(id: movieId);
  }
}
