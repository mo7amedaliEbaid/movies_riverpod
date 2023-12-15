import 'package:isar/isar.dart';
import 'package:movies_riverpod/features/movie_detail/data/datasource/local/movie_detail_local_datasource.dart';
import 'package:movies_riverpod/features/notifications/data/models/notification.dart';
import 'package:movies_riverpod/models/movie_details/movie_detail.dart';

import '../../../../../core/local/cache/local_db.dart';

interface class MovieDetailLocalDataSourceImpl
    extends MovieDetailLocalDataSource {
  LocalDb localDb;

  MovieDetailLocalDataSourceImpl({required this.localDb});

  @override
  Future<int> bookmarkMovie(MovieDetail movieDetail) async {
    await localDb.getDb().writeTxn(() async {
      localDb.getDb().movieDetails.put(movieDetail);
      await localDb.getDb().notificationModels.put(NotificationModel(
          title: movieDetail.title,
          message: 'Successfully added Bookmark',
          positive: true));
    });
    return 1;
  }

  @override
  Future<bool> removeBookmark(MovieDetail movieDetail) async {
    return await localDb.getDb().writeTxn(() async {
      final value = await localDb
          .getDb()
          .movieDetails
          .filter()
          .idEqualTo(movieDetail.id)
          .findFirst();
      await localDb.getDb().notificationModels.put(NotificationModel(
          title: movieDetail.title,
          message: 'Successfully removed Bookmark',
          positive: false));
      return await localDb.getDb().movieDetails.delete(value!.isarId);
    });
  }

  @override
  Future<bool> isBookmarked(int id) async {
    final response =
        await localDb.getDb().movieDetails.filter().idEqualTo(id).findFirst();
    if (response == null) {
      return false;
    } else {
      return true;
    }
  }
}
