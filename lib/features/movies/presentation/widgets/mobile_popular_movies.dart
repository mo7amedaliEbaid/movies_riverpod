import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_riverpod/features/movies/presentation/providers/movies_state_notifier_provider.dart';

import 'package:movies_riverpod/features/movies/presentation/widgets/popular_card.dart';
import 'package:movies_riverpod/features/movies/presentation/widgets/shimmer/movies_vertical_shimmer.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_router.dart';

class MobilePopularMovies extends ConsumerWidget {
  const MobilePopularMovies({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularMoviesState = ref.watch(popularMoviesStateNotifier);
    return popularMoviesState.hasData
        ? SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
            if (index < popularMoviesState.movies.length) {
              final movie = popularMoviesState.movies[index];
              return GestureDetector(
                  onTap: () {
                    context.pushNamed(Routes.movieDetail.name, extra: movie.id);
                  },
                  child: PopularMovie(movie: movie));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }, childCount: popularMoviesState.movies.length + 1))
        : const SliverFillRemaining(
            hasScrollBody: true, child: MoviesVerticalListShimmer());
  }
}
