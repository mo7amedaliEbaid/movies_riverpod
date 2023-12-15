import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_riverpod/features/movies/presentation/providers/movies_state_notifier_provider.dart';
import 'package:movies_riverpod/features/movies/presentation/widgets/custom_screen_title.dart';
import 'package:movies_riverpod/features/movies/presentation/widgets/desktop_upcoming_movies.dart';
import 'package:movies_riverpod/features/movies/presentation/widgets/mobile_upcomig_movies.dart';

import '../../../../core/app/app_strings.dart';
import '../../../../core/network/network_values.dart';
import '../../../../core/responsive/responsive.dart';


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
      ref
          .read(upcomingMoviesStateNotifier.notifier)
          .getMovies(type: EndPoints.upcoming);
    });
    upcomingControl.addListener(upcomingScrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    upcomingControl.removeListener(upcomingScrollListener);
  }

  ScrollController upcomingControl = ScrollController();

  void upcomingScrollListener() {
    if (upcomingControl.position.maxScrollExtent == upcomingControl.offset) {
      ref
          .read(upcomingMoviesStateNotifier.notifier)
          .getMovies(type: EndPoints.upcoming);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(controller: upcomingControl, slivers: [
        const SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [CustomScreenTtle(screentitle: AppStrings.upcoming)],
          ),
        ),
        Responsive.isDesktop(context)
            ? const SliverToBoxAdapter(
                child: DesktopUpcomingMovies(),
              )
            : const MobileUpcomingMovies()
      ]),
    );
  }
}
