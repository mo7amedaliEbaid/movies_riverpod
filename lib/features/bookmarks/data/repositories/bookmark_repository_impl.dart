import 'package:dartz/dartz.dart';
import 'package:movies_riverpod/features/bookmarks/data/datasource/local/bookmark_local_datasource.dart';
import 'package:movies_riverpod/features/bookmarks/domain/repositories/bookmark_repository.dart';
import 'package:movies_riverpod/models/movie_details/movie_detail.dart';

import '../../../../core/util/app_exception.dart';

interface class BookmarkRepositoryImpl extends BookmarkRepository {
  BookmarkLocalDataSource bookmarkLocalDataSource;

  BookmarkRepositoryImpl({required this.bookmarkLocalDataSource});

  @override
  Future<Either<AppException, List<MovieDetail>>> getBookmarks() {
    return bookmarkLocalDataSource.getBookMarkMovies();
  }

  @override
  Future<void> removeBookmark(MovieDetail movieDetail) {
    return bookmarkLocalDataSource.removeBookMark(movieDetail);
  }
}
