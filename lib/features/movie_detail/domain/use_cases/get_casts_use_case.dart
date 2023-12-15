import 'package:dartz/dartz.dart';
import 'package:movies_riverpod/features/movie_detail/domain/repositories/movie_detail_repository.dart';
import 'package:movies_riverpod/models/response/casts_response.dart';

import '../../../../core/util/app_exception.dart';

interface class GetCastsUseCase {
  final MovieDetailRepository movieDetailRepository;

  GetCastsUseCase({required this.movieDetailRepository});

  Future<Either<AppException, CastsResponse>> execute({required int movieId}) async {
    return movieDetailRepository.getCasts(id: movieId);
  }
}
