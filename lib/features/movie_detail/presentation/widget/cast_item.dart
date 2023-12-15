import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_riverpod/core/extensions/build_context_extensions.dart';
import 'package:movies_riverpod/models/cast/cast.dart';

import '../../../../core/app/app_configs.dart';
import '../../../../core/app/app_dimensions.dart';

class CastItem extends StatelessWidget {
  final Cast cast;

  const CastItem({Key? key, required this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.castProfileWidth,
      child: Padding(
        padding: EdgeInsets.only(left: AppDimensions.p8) ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.sp),
              child: CachedNetworkImage(
                imageUrl: AppConfigs.preCastProfilePath(cast.profilePath),
                placeholder: (context, url) => const Center(child:  CircularProgressIndicator()),
                errorWidget: (context, url,error) =>  const Icon(Icons.broken_image),
                height: AppDimensions.castProfileHeight,
                width: AppDimensions.castProfileWidth,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 4.sp,
            ),
            Text(
                cast.originalName,
                style: context.textTheme.bodyMedium,
                maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
