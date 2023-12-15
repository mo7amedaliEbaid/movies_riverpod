import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app/app_configs.dart';
import '../../../../core/app/app_dimensions.dart';
import '../../../../core/widgets/rating_bar.dart';
import '../../../../models/movie/movie.dart';

class NowShowingMovieCard extends StatelessWidget {
  final Movie movie;

  const NowShowingMovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.nowShowingCardWidth,
      child: Padding(
        padding: EdgeInsets.only(left: AppDimensions.p6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(8.sp), // Adjust the radius as needed
              ),
              elevation: 8.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.sp),
                child: CachedNetworkImage(
                  imageUrl: AppConfigs.preMoviePoster(movie.posterPath),
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.broken_image),
                  width: AppDimensions.nowShowingPosterWidth,
                  height: AppDimensions.nowShowingPosterHeight,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: AppDimensions.p6, left: AppDimensions.p8),
              child: Text(
                movie.title,
                style: Theme.of(context).textTheme.titleSmall,
                maxLines: 2,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: AppDimensions.p2, left: AppDimensions.p8),
              child: RatingBar(rating: movie.voteAverage),
            )
          ],
        ),
      ),
    );
  }
}
