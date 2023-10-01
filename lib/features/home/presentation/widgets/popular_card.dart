import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_riverpod/app/app_configs.dart';
import 'package:movies_riverpod/app/app_dimensions.dart';
import 'package:movies_riverpod/features/home/presentation/providers/home_state_notifier_provider.dart';
import 'package:movies_riverpod/models/movie.dart';
import 'package:movies_riverpod/shared/extensions/build_context_extensions.dart';
import 'package:movies_riverpod/shared/widgets/genre_chip.dart';

import 'package:movies_riverpod/shared/widgets/rating_bar.dart';

import '../providers/state/genre_state.dart';


class PopularMovie extends ConsumerWidget {
  final Movie movie;

  const PopularMovie({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genreState = ref.watch(genreStateNotifier);
    return Container(
      padding: EdgeInsets.only(top: AppDimensions.p8, left: AppDimensions.p18, right: AppDimensions.p18),
      child: Row(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimensions.p8),
            ),
            elevation: 8.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimensions.p8),
              child: CachedNetworkImage(
                imageUrl: AppConfigs.preMoviePoster(movie.posterPath),
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.broken_image),
                width: AppDimensions.popularPosterWidth,
                height: AppDimensions.popularPosterHeight,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: AppDimensions.p12, top: AppDimensions.p10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    children: [
                      Text(
                        movie.title,
                        style: context.textTheme.titleSmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(height: AppDimensions.p8,),
                  RatingBar(rating: movie.voteAverage),
                  SizedBox(height: AppDimensions.p8,),
                  if (genreState.state == GenreConcreteState.loaded) SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: movie.genreIds.map((label) {
                        final genre = genreState.genres
                            .firstWhere((element) => element.id == label);
                        return GenreChip(label: genre.name);
                      }).toList(),
                    ),
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
