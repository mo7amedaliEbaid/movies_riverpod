import 'package:movies_riverpod/features/bookmarks/data/datasource/local/bookmark_local_datasource.dart';
import 'package:movies_riverpod/features/bookmarks/data/datasource/local/bookmark_local_datasource_impl.dart';
import 'package:movies_riverpod/features/bookmarks/domain/repositories/bookmark_repository.dart';
import 'package:movies_riverpod/features/bookmarks/data/repositories/bookmark_repository_impl.dart';
import 'package:movies_riverpod/features/bookmarks/domain/use_cases/get_bookmarks_use_case.dart';
import 'package:movies_riverpod/features/movies/data/datasource/local/movies_local_datasource.dart';
import 'package:movies_riverpod/features/movies/data/datasource/local/movies_local_datasource_impl.dart';
import 'package:movies_riverpod/features/movies/data/datasource/remote/movies_remote_data_source.dart';
import 'package:movies_riverpod/features/movies/data/datasource/remote/movies_remote_datasource.dart';
import 'package:movies_riverpod/features/movies/domain/repositories/movies_repository.dart';
import 'package:movies_riverpod/features/movies/data/repositories/movies_repository_impl.dart';
import 'package:movies_riverpod/features/movies/domain/use_cases/fetch_and_cache_genre_use_case.dart';
import 'package:movies_riverpod/features/movies/domain/use_cases/fetch_and_cache_movies_use_case.dart';
import 'package:movies_riverpod/features/movies/domain/use_cases/fetch_cached_genre_use_case.dart';
import 'package:movies_riverpod/features/movies/domain/use_cases/fetch_cached_movies_use_case.dart';
import 'package:movies_riverpod/features/movie_detail/data/datasource/local/movie_detail_local_datasource.dart';
import 'package:movies_riverpod/features/movie_detail/data/datasource/local/movie_detail_local_datasource_impl.dart';
import 'package:movies_riverpod/features/movie_detail/data/datasource/remote/movie_detail_remote_data_source.dart';
import 'package:movies_riverpod/features/movie_detail/data/datasource/remote/movie_detail_remote_datasource.dart';
import 'package:movies_riverpod/features/movie_detail/domain/repositories/movie_detail_repository.dart';
import 'package:movies_riverpod/features/movie_detail/data/repositories//movie_detail_repository_impl.dart';
import 'package:movies_riverpod/features/movie_detail/domain/use_cases/add_bookmark_use_case.dart';
import 'package:movies_riverpod/features/movie_detail/domain/use_cases/get_casts_use_case.dart';
import 'package:movies_riverpod/features/movie_detail/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movies_riverpod/features/movie_detail/domain/use_cases/is_bookmark_use_case.dart';
import 'package:movies_riverpod/features/notifications/data/datasource/local/notifications_local_datasource.dart';
import 'package:movies_riverpod/features/notifications/data/datasource/local/notifications_local_datasource_impl.dart';
import 'package:movies_riverpod/features/notifications/domain/repository/notifications_repository.dart';
import 'package:movies_riverpod/features/notifications/data/repository/notifications_repository_impl.dart';
import 'package:movies_riverpod/features/notifications/domain/use_cases/clear_all_notifications_use_case.dart';
import 'package:get_it/get_it.dart';

import '../core/local/cache/local_db.dart';
import '../core/local/cache/local_db_impl.dart';
import '../core/local/shared_prefs/shared_pref.dart';
import '../core/local/shared_prefs/shared_pref_impl.dart';
import '../core/network/dio_network_service.dart';
import '../core/network/network_service.dart';
import '../features/movie_detail/domain/use_cases/remove_bookmark_use_case.dart';
import '../features/notifications/domain/use_cases/get_all_notifications_use_case.dart';

final injector = GetIt.instance;

Future<void> initSingletons() async {
  //Services
  injector.registerLazySingleton<LocalDb>(() => InitDbImpl());
  injector.registerLazySingleton<NetworkService>(() => DioNetworkService());
  injector.registerLazySingleton<SharedPref>(() => SharedPrefImplementation());

  //initiating db
  await injector<LocalDb>().initDb();
}

void provideDataSources() {
  //Home
  injector.registerFactory<MoviesLocalDataSource>(
      () => MoviesLocalDataSourceImpl(localDb: injector.get<LocalDb>()));
  injector.registerFactory<MoviesRemoteDataSource>(() =>
      MoviesRemoteDataSourceImpl(networkService: injector.get<NetworkService>()));

  //MovieDetail
  injector.registerFactory<MovieDetailRemoteDataSource>(() =>
      MovieDetailRemoteDataSourceImpl(
          networkService: injector.get<NetworkService>()));
  injector.registerFactory<MovieDetailLocalDataSource>(
      () => MovieDetailLocalDataSourceImpl(localDb: injector.get<LocalDb>()));

  //Bookmark
  injector.registerFactory<BookmarkLocalDataSource>(
      () => BookmarkLocalDataSourceImpl(localDb: injector.get<LocalDb>()));

  //Notification
  injector.registerFactory<NotificationsLocalDataSource>(
      () => NotificationsLocalDataSourceImpl(localDb: injector.get<LocalDb>()));
}

void provideRepositories() {
  //home
  injector.registerFactory<MoviesRepository>(() => MoviesRepoImpl(
      moviesRemoteDataSource: injector.get<MoviesRemoteDataSource>(),
      moviesLocalDataSource: injector.get<MoviesLocalDataSource>()));

  //MovieDetail
  injector.registerFactory<MovieDetailRepository>(() => MovieDetailRepoImpl(
      movieDetailDataSource: injector.get<MovieDetailRemoteDataSource>(),
      movieDetailLocalDataSource: injector.get<MovieDetailLocalDataSource>()));

  //Bookmark
  injector.registerFactory<BookmarkRepository>(() => BookmarkRepositoryImpl(
      bookmarkLocalDataSource: injector.get<BookmarkLocalDataSource>()));

  //Notification
  injector.registerFactory<NotificationRepository>(() => NotificationRepoImpl(
      notificationsLocalDataSource:
          injector.get<NotificationsLocalDataSource>()));
}

void provideUseCases() {
  //home
  injector.registerFactory<FetchAndCacheGenreUseCase>(() =>
      FetchAndCacheGenreUseCase(
          homeRepository: injector.get<MoviesRepository>()));
  injector.registerFactory<FetchAndCacheMoviesUseCase>(() =>
      FetchAndCacheMoviesUseCase(
          homeRepository: injector.get<MoviesRepository>()));
  injector.registerFactory<FetchCacheGenresUseCase>(() =>
      FetchCacheGenresUseCase(homeRepository: injector.get<MoviesRepository>()));
  injector.registerFactory<FetchCachedMoviesUseCase>(() =>
      FetchCachedMoviesUseCase(homeRepository: injector.get<MoviesRepository>()));

  //MovieDetail
  injector.registerFactory<AddBookmarkUseCase>(() => AddBookmarkUseCase(
      movieDetailRepository: injector.get<MovieDetailRepository>()));
  injector.registerFactory<GetCastsUseCase>(() => GetCastsUseCase(
      movieDetailRepository: injector.get<MovieDetailRepository>()));
  injector.registerFactory<GetMovieDetailsUseCase>(() => GetMovieDetailsUseCase(
      movieDetailRepository: injector.get<MovieDetailRepository>()));
  injector.registerFactory<IsBookmarkedUseCase>(() => IsBookmarkedUseCase(
      movieDetailRepository: injector.get<MovieDetailRepository>()));
  injector.registerFactory<RemoveBookmarkUseCase>(() => RemoveBookmarkUseCase(
      movieDetailRepository: injector.get<MovieDetailRepository>()));

  //Bookmarks
  injector.registerFactory<GetBookmarksUseCase>(() => GetBookmarksUseCase(
      bookmarkRepository: injector.get<BookmarkRepository>()));

  //Notifications
  injector.registerFactory<GetAllNotificationsUseCase>(() =>
      GetAllNotificationsUseCase(
          notificationRepository: injector.get<NotificationRepository>()));
  injector.registerFactory<ClearAllNotificationsUseCase>(() =>
      ClearAllNotificationsUseCase(
          notificationRepository: injector.get<NotificationRepository>()));
}
