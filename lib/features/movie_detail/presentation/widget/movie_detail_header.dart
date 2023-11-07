import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_riverpod/app/app_colors.dart';
import 'package:movies_riverpod/app/app_configs.dart';
import 'package:movies_riverpod/app/app_dimensions.dart';
import 'package:movies_riverpod/models/movie_details/movie_detail.dart';
import 'package:movies_riverpod/shared/responsive/responsive.dart';

class MovieDetailHeader extends StatelessWidget {
  final MovieDetail movieDetail;

  const MovieDetailHeader({Key? key, required this.movieDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: AppDimensions.movieDetailBackdropHeight,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            // context.router
          },
          icon: const Icon(Icons.more_horiz),
          color: AppColors.primaryLight,
        )
      ],
      stretch: true,
      pinned: false,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.zoomBackground,
          StretchMode.blurBackground
        ],
        background: CachedNetworkImage(
          imageUrl: AppConfigs.preMovieBackdrop(movieDetail.backdropPath),
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.broken_image),
          fit: Responsive.isDesktop(context) ? BoxFit.fitHeight : BoxFit.cover,
        ),
      ),
    );
  }
}
