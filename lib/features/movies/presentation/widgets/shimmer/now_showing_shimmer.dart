import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/app/app_dimensions.dart';
import '../../../../../core/widgets/shimmers/skeleton.dart';

class NowShowingMoviesShimmer extends StatelessWidget {
  const NowShowingMoviesShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade300,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return const NowShowingCardShimmer();
            }));
  }
}

class NowShowingCardShimmer extends StatelessWidget {
  const NowShowingCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.nowShowingCardHeight,
      width: AppDimensions.nowShowingCardWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Skeleton(
              height: AppDimensions.nowShowingPosterHeight,
              width: AppDimensions.nowShowingPosterWidth,
              left: 6,
              right: 0,
              top: 0,
              bottom: 0),
          Skeleton(
            height: 10,
            width: AppDimensions.nowShowingPosterWidth,
            left: 10,
            right: 10,
            top: 6,
            bottom: 0,
          ),
          Skeleton(
            height: 10,
            width: AppDimensions.nowShowingPosterWidth,
            left: 10,
            right: 10,
            top: 4,
            bottom: 0,
          ),
        ],
      ),
    );
  }
}
