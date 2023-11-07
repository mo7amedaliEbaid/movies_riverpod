import 'package:movies_riverpod/features/movie_detail/domain/repositories/movie_detail_repository.dart';
import 'package:movies_riverpod/models/movie_details/movie_detail.dart';

interface class RemoveBookmarkUseCase {
  final MovieDetailRepository movieDetailRepository;

  RemoveBookmarkUseCase({required this.movieDetailRepository});

  Future<bool> execute(MovieDetail movieDetail) async {
    return movieDetailRepository.removeBookmark(movieDetail);
  }
}
