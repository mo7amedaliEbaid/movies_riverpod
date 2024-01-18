import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_riverpod/features/movie_detail/presentation/provider/movie_detail_state_notifier.dart';
import 'package:movies_riverpod/features/movie_detail/presentation/provider/state/casts_state.dart';
import 'package:movies_riverpod/features/movie_detail/presentation/widget/cast_item.dart';

class CastsList extends ConsumerWidget {
  final int id;

  const CastsList({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final castsNotifier = ref.watch(castsStateNotifier(id));
    return castsNotifier.state == CastConcreteState.loading
        ? const Center(child: CircularProgressIndicator())
        : ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              },
            ),
            child: ListView.builder(
                itemCount: castsNotifier.casts.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CastItem(
                    cast: castsNotifier.casts[index],
                  );
                }),
          );
  }
}
