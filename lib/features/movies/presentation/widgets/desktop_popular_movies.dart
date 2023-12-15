import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_riverpod/features/movies/presentation/providers/movies_state_notifier_provider.dart';

import 'package:movies_riverpod/features/movies/presentation/widgets/popular_card.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_router.dart';

class DeskTopPopularMovies extends ConsumerWidget {
  const DeskTopPopularMovies({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularMoviesState = ref.watch(popularMoviesStateNotifier);
    return popularMoviesState.hasData
        ? Wrap(
            children: List.generate(
              popularMoviesState.movies.length + 1,
              (index) {
                if (index < popularMoviesState.movies.length) {
                  final movie = popularMoviesState.movies[index];
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed(
                        Routes.movieDetail.name,
                        extra: movie.id,
                      );
                    },
                    child: PopularMovie(movie: movie),
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
