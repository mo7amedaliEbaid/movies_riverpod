import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_riverpod/core/extensions/build_context_extensions.dart';

import 'package:movies_riverpod/features/bookmarks/presentation/providers/bookmark_notifier_provider.dart';
import 'package:movies_riverpod/models/movie_details/movie_detail.dart';

import '../../../../core/app/app_configs.dart';
import '../../../../core/app/app_dimensions.dart';
import '../../../../core/widgets/rating_bar.dart';



class BookmarkCard extends StatelessWidget {
  final MovieDetail movieDetail;

  const BookmarkCard({Key? key, required this.movieDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: AppDimensions.p8, right: AppDimensions.p16, left: AppDimensions.p16),
      child: Row(
        children: [
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimensions.p8)),
            elevation: 8.sp,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimensions.p8),
              child: CachedNetworkImage(
                imageUrl: AppConfigs.preMoviePoster(movieDetail.posterPath),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.broken_image),
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                height: AppDimensions.nowShowingPosterHeight,
                width: AppDimensions.nowShowingPosterWidth,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                  top: AppDimensions.p10,
                  left: AppDimensions.p8,
                  right: AppDimensions.p8),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Consumer(
                      builder: (context, ref, child) {
                        return InkWell(
                            onTap: () {
                             ref.read(bookmarkNotifierProvider.notifier).removeBookmark(movieDetail);
                            },
                            child: SizedBox(
                                width: 30,
                                height: 30,
                                child: SvgPicture.asset(
                                  'assets/images/icons/heart_filled.svg',
                                  colorFilter: const ColorFilter.mode(
                                      Colors.red, BlendMode.srcIn),
                                  height: 30.sp,
                                  width: 30.sp,
                                )
                                    ));
                      },
                    ),
                  ),
                  Text(
                    movieDetail.title,
                    maxLines: 2,
                    style: context.textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: AppDimensions.p14,
                  ),
                  RatingBar(rating: movieDetail.voteAverage),
                  SizedBox(
                    height: AppDimensions.p8,
                  ),
                  Text(
                    movieDetail.overview,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
