import 'package:dartz/dartz.dart';
import 'package:movies_riverpod/features/movies/domain/repositories/movies_repository.dart';
import 'package:movies_riverpod/models/movies/movies.dart';

import '../../../../core/util/app_exception.dart';

interface class FetchAndCacheMoviesUseCase {
  final MoviesRepository homeRepository;

  FetchAndCacheMoviesUseCase({required this.homeRepository});

  Future<Either<AppException, Movies>> execute({required int page,required String type}) {
    return homeRepository.fetchAndCacheMovies(page: page ,type: type);
  }
}
