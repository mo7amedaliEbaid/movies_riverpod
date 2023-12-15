import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

import '../../../../../core/app/app_dimensions.dart';
import '../../../../../core/widgets/shimmers/skeleton.dart';

class MoviesVerticalListShimmer extends StatelessWidget {
  const MoviesVerticalListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade300,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 3,
            itemBuilder: (context, index) {
              return const MoviesVerticalCardShimmer();
            }));
  }
}

class MoviesVerticalCardShimmer extends StatelessWidget {
  const MoviesVerticalCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.popularPosterHeight,
      child: Padding(
        padding: EdgeInsets.only(
            top: AppDimensions.p8,
            left: AppDimensions.p18,
            right: AppDimensions.p18),
        child: Row(children: [
          Skeleton(
              height: AppDimensions.popularPosterHeight,
              width: AppDimensions.popularPosterWidth,
              left: 0,
              right: 0,
              top: 0,
              bottom: 0),
          Container(
            padding: EdgeInsets.only(
                left: AppDimensions.p12, top: AppDimensions.p10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Skeleton(
                  height: 20,
                  width: AppDimensions.nowShowingPosterWidth,
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                ),
                Skeleton(
                  height: 15,
                  width: AppDimensions.nowShowingPosterWidth,
                  left: 0,
                  right: 0,
                  top: 8,
                  bottom: 0,
                ),
                Skeleton(
                  height: 25,
                  width: AppDimensions.nowShowingPosterWidth,
                  left: 0,
                  right: 0,
                  top: 8,
                  bottom: 0,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
