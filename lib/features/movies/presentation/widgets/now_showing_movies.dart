import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_riverpod/features/movies/presentation/providers/movies_state_notifier_provider.dart';
import 'package:movies_riverpod/features/movies/presentation/widgets/now_showing_card.dart';
import 'package:movies_riverpod/features/movies/presentation/widgets/shimmer/now_showing_shimmer.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app/app_dimensions.dart';
import '../../../../core/routes/app_router.dart';

class NowShowingMovies extends ConsumerWidget {
  final ScrollController scrollController;

  const NowShowingMovies({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nowShowingMoviesState = ref.watch(nowShowingMoviesStateNotifier);
    return SizedBox(
      height: AppDimensions.nowShowingCardHeight,
      child: nowShowingMoviesState.hasData
          ? ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                },
              ),
              child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: nowShowingMoviesState.movies.length + 1,
                itemBuilder: (context, index) {
                  if (index < nowShowingMoviesState.movies.length) {
                    final movie = nowShowingMoviesState.movies[index];
                    return GestureDetector(
                        onTap: () {
                          context.pushNamed(Routes.movieDetail.name,
                              extra: movie.id);
                        },
                        child: NowShowingMovieCard(movie: movie));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )
          : const NowShowingMoviesShimmer(),
    );
  }
}
