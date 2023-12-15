import 'package:dartz/dartz.dart';
import 'package:movies_riverpod/models/movie_details/movie_detail.dart';

import '../../../../core/util/app_exception.dart';

abstract class BookmarkRepository {
  Future<Either<AppException, List<MovieDetail>>> getBookmarks();

  Future<void> removeBookmark(MovieDetail movieDetail);
}
