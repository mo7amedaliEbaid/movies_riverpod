import 'package:dartz/dartz.dart';
import 'package:movies_riverpod/features/movies/domain/repositories/home_repository.dart';
import 'package:movies_riverpod/models/domain/movies.dart';
import 'package:movies_riverpod/shared/util/app_exception.dart';

interface class FetchCachedMoviesUseCase {
  final HomeRepository homeRepository;

  FetchCachedMoviesUseCase({required this.homeRepository});

  Future<Either<AppException, Movies>> execute({required String type}) {
    return homeRepository.fetchCachedMovies(type: type);
  }
}
