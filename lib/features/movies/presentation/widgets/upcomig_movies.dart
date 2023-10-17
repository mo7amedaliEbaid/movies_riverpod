import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_riverpod/features/movies/presentation/providers/movies_state_notifier_provider.dart';

import 'package:movies_riverpod/features/movies/presentation/widgets/popular_card.dart';
import 'package:movies_riverpod/features/movies/presentation/widgets/shimmer/movies_vertical_shimmer.dart';
import 'package:movies_riverpod/features/movies/presentation/widgets/upcoming_card.dart';
import 'package:movies_riverpod/routes/app_router.dart';
import 'package:go_router/go_router.dart';

class UpcomingMovies extends ConsumerWidget {
  const UpcomingMovies({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final upcomingMoviesState = ref.watch(upcomingMoviesStateNotifier);
    return upcomingMoviesState.hasData
        ? SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          if (index < upcomingMoviesState.movies.length) {
            final movie = upcomingMoviesState.movies[index];
            return GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.movieDetail.name,
                      extra: movie.id);
                },
                child: UpcomingMovie(movie: movie));
          }
          else {
            return const Center(child: CircularProgressIndicator());
          }
        }, childCount: upcomingMoviesState.movies.length + 1))
        : const SliverFillRemaining(hasScrollBody: true,child: MoviesVerticalListShimmer());
  }
}
