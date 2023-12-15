import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_riverpod/features/movies/presentation/providers/movies_state_notifier_provider.dart';


import 'package:movies_riverpod/features/movies/presentation/widgets/custom_movie_card.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_router.dart';

class DesktopTrendingMovies extends ConsumerWidget {
  const DesktopTrendingMovies({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendingMoviesState = ref.watch(trendingMoviesStateNotifier);
    return trendingMoviesState.hasData
        ? Wrap(
      children: List.generate(
        trendingMoviesState.movies.length + 1,
            (index) {
          if (index < trendingMoviesState.movies.length) {
            final movie = trendingMoviesState.movies[index];
            return GestureDetector(
              onTap: () {
                context.pushNamed(
                  Routes.movieDetail.name,
                  extra: movie.id,
                );
              },
              child: CustomMovieCard(movie: movie),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    )
        : const Center(
      child: CircularProgressIndicator(),
    );
  }
}
