import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_riverpod/core/extensions/build_context_extensions.dart';

import 'package:movies_riverpod/features/movies/presentation/providers/movies_state_notifier_provider.dart';
import 'package:movies_riverpod/features/movies/presentation/widgets/desktop_popular_movies.dart';
import 'package:movies_riverpod/features/movies/presentation/widgets/now_showing_movies.dart';
import 'package:movies_riverpod/features/movies/presentation/widgets/mobile_popular_movies.dart';

import '../../../../core/app/app_dimensions.dart';
import '../../../../core/app/app_strings.dart';
import '../../../../core/network/network_values.dart';
import '../../../../core/responsive/responsive.dart';


class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future(() {
      ref
          .read(nowShowingMoviesStateNotifier.notifier)
          .getMovies(type: EndPoints.nowShowing);
      ref
          .read(popularMoviesStateNotifier.notifier)
          .getMovies(type: EndPoints.popular);
    });
    nowShowingControl.addListener(nowShowingScrollListener);
    popularControl.addListener(popularScrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    nowShowingControl.removeListener(nowShowingScrollListener);
    popularControl.removeListener(popularScrollListener);
  }

  ScrollController nowShowingControl = ScrollController();
  ScrollController popularControl = ScrollController();

  void nowShowingScrollListener() {
    if (nowShowingControl.position.maxScrollExtent ==
        nowShowingControl.offset) {
      ref
          .read(nowShowingMoviesStateNotifier.notifier)
          .getMovies(type: EndPoints.nowShowing);
    }
  }

  void popularScrollListener() {
    if (popularControl.position.maxScrollExtent == popularControl.offset) {
      ref
          .read(popularMoviesStateNotifier.notifier)
          .getMovies(type: EndPoints.popular);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(controller: popularControl, slivers: [
        SliverToBoxAdapter(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: AppDimensions.p18,
                  bottom: AppDimensions.p8,
                  top: AppDimensions.p18),
              child: Text(
                AppStrings.nowShowing,
                style: context.textTheme.titleMedium,
              ),
            ),
            NowShowingMovies(
              scrollController: nowShowingControl,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: AppDimensions.p18,
                bottom: AppDimensions.p8,
              ),
              child: Text(
                AppStrings.popular,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        )),
        Responsive.isDesktop(context)
            ? const SliverToBoxAdapter(
                child: DeskTopPopularMovies(),
              )
            : const MobilePopularMovies()
      ]),
    );
  }
}
