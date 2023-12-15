import 'package:dartz/dartz.dart';
import 'package:isar/isar.dart';
import 'package:movies_riverpod/features/bookmarks/data/datasource/local/bookmark_local_datasource.dart';
import 'package:movies_riverpod/features/notifications/data/models/notification.dart';
import 'package:movies_riverpod/models/movie_details/movie_detail.dart';

import '../../../../../core/local/cache/local_db.dart';
import '../../../../../core/util/app_exception.dart';


interface class BookmarkLocalDataSourceImpl extends BookmarkLocalDataSource {
  LocalDb localDb;

  BookmarkLocalDataSourceImpl({required this.localDb});

  @override
  Future<Either<AppException, List<MovieDetail>>> getBookMarkMovies() async {
    final movies = await localDb.getDb().movieDetails.where().findAll();
    if (movies.isEmpty) {
      return Left(AppException(
          message: 'No Bookmark available',
          statusCode: 0,
          identifier: 'bookmark',
          which: 'local'));
    } else {
      return Right(movies);
    }
  }

  @override
  Future<void> removeBookMark(MovieDetail movieDetail) async {
    await localDb.getDb().writeTxn(() async{
      await localDb.getDb().movieDetails.delete(movieDetail.isarId);
      await localDb.getDb().notificationModels.put(NotificationModel(title: movieDetail.title, message: 'Successfully removed Bookmark', positive: false));
    });
  }
}
