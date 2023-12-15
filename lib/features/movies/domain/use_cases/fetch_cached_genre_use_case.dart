import 'package:dartz/dartz.dart';
import 'package:movies_riverpod/features/movies/domain/repositories/movies_repository.dart';
import 'package:movies_riverpod/models/genres/genres.dart';

import '../../../../core/util/app_exception.dart';

interface class FetchCacheGenresUseCase {
  final MoviesRepository homeRepository;

  FetchCacheGenresUseCase({required this.homeRepository});

  Future<Either<AppException, Genres>> execute() {
    return homeRepository.fetchCachedGenres();
  }
}
