import 'package:flutter/material.dart';
import 'package:movies_riverpod/features/home/presentation/screens/home_page.dart';
import 'package:movies_riverpod/features/map/find_cinemas.dart';
import 'package:movies_riverpod/features/movie_detail/presentation/screen/movie_detail_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

enum Routes {
  home,
  movieDetail,
  bookmarks,
  map,
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: '/',
        name: Routes.home.name,
        builder: (context, state) => HomePage(
          key: state.pageKey,
        ),
      ),
      GoRoute(
          path: '/movieDetail',
          name: Routes.movieDetail.name,
          builder: (context, state) => MovieDetailScreen(
              key: state.pageKey, movieId: state.extra as int)),
     /* GoRoute(
        path: '/map',
        name: Routes.map.name,
        builder: (context, state) => FindCinemas(
          key: state.pageKey,
        ),
      ),*/
    ],
  );
}
