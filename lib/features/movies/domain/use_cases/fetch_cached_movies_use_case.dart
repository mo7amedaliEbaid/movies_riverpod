import 'package:dartz/dartz.dart';
import 'package:movies_riverpod/features/movies/domain/repositories/movies_repository.dart';
import 'package:movies_riverpod/models/movies/movies.dart';
import '../../../../core/util/app_exception.dart';

interface class FetchCachedMoviesUseCase {
  final MoviesRepository homeRepository;

  FetchCachedMoviesUseCase({required this.homeRepository});

  Future<Either<AppException, Movies>> execute({required String type}) {
    return homeRepository.fetchCachedMovies(type: type);
  }
}
