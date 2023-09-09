import 'package:dartz/dartz.dart';
import 'package:movies_riverpod/features/bookmarks/domain/repositories/bookmark_repository.dart';
import 'package:movies_riverpod/models/movie_detail.dart';
import 'package:movies_riverpod/shared/util/app_exception.dart';

class GetBookmarksUseCase {
  final BookmarkRepository bookmarkRepository;

  GetBookmarksUseCase({required this.bookmarkRepository});

  Future<Either<AppException, List<MovieDetail>>> execute() async {
    return bookmarkRepository.getBookmarks();
  }
}
