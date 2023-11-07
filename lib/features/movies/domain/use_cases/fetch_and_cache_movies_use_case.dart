import 'package:dartz/dartz.dart';
import 'package:movies_riverpod/features/movies/domain/repositories/home_repository.dart';
import 'package:movies_riverpod/models/movies/movies.dart';
import 'package:movies_riverpod/shared/util/app_exception.dart';

interface class FetchAndCacheMoviesUseCase {
  final HomeRepository homeRepository;

  FetchAndCacheMoviesUseCase({required this.homeRepository});

  Future<Either<AppException, Movies>> execute({required int page,required String type}) {
    return homeRepository.fetchAndCacheMovies(page: page ,type: type);
  }
}
