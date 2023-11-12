import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_riverpod/app/app_dimensions.dart';
import 'package:movies_riverpod/app/app_strings.dart';
import 'package:movies_riverpod/features/movies/presentation/providers/movies_state_notifier_provider.dart';
import 'package:movies_riverpod/features/movies/presentation/widgets/custom_screen_title.dart';
import 'package:movies_riverpod/features/movies/presentation/widgets/trending_movies.dart';

import 'package:movies_riverpod/features/movies/presentation/widgets/upcomig_movies.dart';
import 'package:movies_riverpod/shared/network/network_values.dart';

class TrendingScreen extends ConsumerStatefulWidget {
  const TrendingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends ConsumerState<TrendingScreen> {
  @override
  void initState() {
    super.initState();
    Future(() {
      ref
          .read(trendingMoviesStateNotifier.notifier)
          .getMovies(type: EndPoints.trending);
    });
    trendingControl.addListener(trendingScrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    trendingControl.removeListener(trendingScrollListener);
  }

  ScrollController trendingControl = ScrollController();

  void trendingScrollListener() {
    if (trendingControl.position.maxScrollExtent == trendingControl.offset) {
      ref
          .read(trendingMoviesStateNotifier.notifier)
          .getMovies(type: EndPoints.trending);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(controller: trendingControl, slivers: const [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [CustomScreenTtle(screentitle: AppStrings.trending)],
          ),
        ),
        const TrendingMovies()
      ]),
    );
  }
}
