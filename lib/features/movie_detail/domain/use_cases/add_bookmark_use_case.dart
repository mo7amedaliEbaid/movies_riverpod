import 'package:movies_riverpod/features/movie_detail/domain/repositories/movie_detail_repository.dart';
import 'package:movies_riverpod/models/movie_details/movie_detail.dart';

interface class AddBookmarkUseCase {
  final MovieDetailRepository movieDetailRepository;

  AddBookmarkUseCase({required this.movieDetailRepository});

  Future<int> execute(MovieDetail movieDetail) async {
    return movieDetailRepository.bookmarkMovieDetail(movieDetail);
  }
}
