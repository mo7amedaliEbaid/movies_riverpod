import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_riverpod/core/responsive/responsive.dart';
import 'package:movies_riverpod/features/movie_detail/presentation/provider/movie_detail_state_notifier.dart';
import 'package:movies_riverpod/features/movie_detail/presentation/provider/state/movie_detail_state.dart';
import 'package:movies_riverpod/features/movie_detail/presentation/widget/desktop_movie_detail_body.dart';
import 'package:movies_riverpod/features/movie_detail/presentation/widget/mobile_movie_detail_body.dart';
import 'package:movies_riverpod/features/movie_detail/presentation/widget/mobile_movie_detail_header.dart';

class MovieDetailScreen extends ConsumerStatefulWidget {
  final int movieId;

  const MovieDetailScreen({super.key, required this.movieId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MovieDetailScreenState();
}

class _MovieDetailScreenState extends ConsumerState<MovieDetailScreen> {
  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(movieDetailStateNotifier.notifier).getMovie(id: widget.movieId);
      ref
          .read(movieDetailStateNotifier.notifier)
          .checkIfBookMarked(widget.movieId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(movieDetailStateNotifier);
    return Scaffold(
        body: notifier.state == MovieDetailConcreteState.loading
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Responsive.isDesktop(context)
                    ? CustomScrollView(slivers: [
                        MobileMovieDetailHeader(
                            movieDetail: notifier.movieDetail),
                        MobileMovieDetailBody(movieDetail: notifier.movieDetail)
                      ])
                    : CustomScrollView(slivers: [
                        MobileMovieDetailHeader(
                            movieDetail: notifier.movieDetail),
                        MobileMovieDetailBody(movieDetail: notifier.movieDetail)
                      ]),
              ));
  }
}
