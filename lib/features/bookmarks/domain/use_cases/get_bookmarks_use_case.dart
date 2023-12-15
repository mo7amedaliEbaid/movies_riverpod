import 'package:dartz/dartz.dart';
import 'package:movies_riverpod/features/bookmarks/domain/repositories/bookmark_repository.dart';
import 'package:movies_riverpod/models/movie_details/movie_detail.dart';

import '../../../../core/util/app_exception.dart';

interface class GetBookmarksUseCase {
  final BookmarkRepository bookmarkRepository;

  GetBookmarksUseCase({required this.bookmarkRepository});

  Future<Either<AppException, List<MovieDetail>>> execute() async {
    return bookmarkRepository.getBookmarks();
  }
}
