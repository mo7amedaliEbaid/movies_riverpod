import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_riverpod/features/movies/presentation/providers/movies_state_notifier_provider.dart';


import 'package:movies_riverpod/features/movies/presentation/widgets/custom_movie_card.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_router.dart';

class DesktopUpcomingMovies extends ConsumerWidget {
  const DesktopUpcomingMovies({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final upcomingMoviesState = ref.watch(upcomingMoviesStateNotifier);
    return upcomingMoviesState.hasData
        ? Wrap(
      children: List.generate(
        upcomingMoviesState.movies.length + 1,
            (index) {
          if (index < upcomingMoviesState.movies.length) {
            final movie = upcomingMoviesState.movies[index];
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
