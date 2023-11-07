import 'package:movies_riverpod/features/bookmarks/domain/repositories/bookmark_repository.dart';
import 'package:movies_riverpod/models/movie_details/movie_detail.dart';

interface class RemoveBookmarkUseCase {
  final BookmarkRepository bookmarkRepository;

  RemoveBookmarkUseCase({required this.bookmarkRepository});

  Future<void> execute(MovieDetail movieDetail) async {
    return bookmarkRepository.removeBookmark(movieDetail);
  }
}