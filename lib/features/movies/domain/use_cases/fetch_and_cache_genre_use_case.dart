import 'package:dartz/dartz.dart';
import 'package:movies_riverpod/features/movies/domain/repositories/home_repository.dart';
import 'package:movies_riverpod/models/genres/genres.dart';
import 'package:movies_riverpod/shared/util/app_exception.dart';

interface class FetchAndCacheGenreUseCase {
  final HomeRepository homeRepository;

  FetchAndCacheGenreUseCase({required this.homeRepository});

  Future<Either<AppException, Genres>> execute() {
    return homeRepository.fetchAndCacheGenres();
  }
}
