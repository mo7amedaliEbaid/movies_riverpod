import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_riverpod/app/app_dimensions.dart';
import 'package:movies_riverpod/app/app_strings.dart';
import 'package:movies_riverpod/features/movies/presentation/providers/movies_state_notifier_provider.dart';
import 'package:movies_riverpod/features/movies/presentation/widgets/now_showing_movies.dart';
import 'package:movies_riverpod/features/movies/presentation/widgets/popular_movies.dart';
import 'package:movies_riverpod/features/movies/presentation/widgets/upcomig_movies.dart';
import 'package:movies_riverpod/shared/extensions/build_context_extensions.dart';
import 'package:movies_riverpod/shared/network/network_values.dart';

class UpcomingScreen extends ConsumerStatefulWidget {
  const UpcomingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends ConsumerState<UpcomingScreen> {
  @override
  void initState() {
    super.initState();
    Future(() {
      //   ref.read(nowShowingMoviesStateNotifier.notifier).getMovies(type: EndPoints.nowShowing);
      ref
          .read(upcomingMoviesStateNotifier.notifier)
          .getMovies(type: EndPoints.upcoming);
    });
    //  nowShowingControl.addListener(nowShowingScrollListener);
    upcomingControl.addListener(upcomingScrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    // nowShowingControl.removeListener(nowShowingScrollListener);
    upcomingControl.removeListener(upcomingScrollListener);
  }

  // ScrollController nowShowingControl = ScrollController();
  ScrollController upcomingControl = ScrollController();

/*  void nowShowingScrollListener() {
    if (nowShowingControl.position.maxScrollExtent ==
        nowShowingControl.offset) {
      ref.read(nowShowingMoviesStateNotifier.notifier).getMovies(type: EndPoints.nowShowing);
    }
  }*/

  void upcomingScrollListener() {
    if (upcomingControl.position.maxScrollExtent == upcomingControl.offset) {
      ref
          .read(upcomingMoviesStateNotifier.notifier)
          .getMovies(type: EndPoints.popular);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(controller: upcomingControl, slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: AppDimensions.p18,
                  bottom: AppDimensions.p24,
                ),
                child: Text(
                  AppStrings.upcoming,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),

        const UpcomingMovies()
      ]),
    );
  }
}
