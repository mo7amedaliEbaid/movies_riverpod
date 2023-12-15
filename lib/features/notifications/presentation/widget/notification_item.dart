import 'package:flutter/cupertino.dart';
import 'package:movies_riverpod/core/extensions/build_context_extensions.dart';

import '../../../../core/app/app_colors.dart';
import '../../../../core/app/app_dimensions.dart';
import '../../data/models/notification.dart';



class NotificationItem extends StatelessWidget {
  final NotificationModel notificationModel;

  const NotificationItem({Key? key, required this.notificationModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppDimensions.p4,
          right: AppDimensions.p8,
          left: AppDimensions.p8),
      child: Container(
        padding: EdgeInsets.only(top: AppDimensions.p12,
            bottom: AppDimensions.p12,
            right: AppDimensions.p12,
            left: AppDimensions.p12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.p8),
            color: context.theme.brightness == Brightness.light
                ? notificationModel.positive
                ? AppColors.updateNotificationColorLight
                : AppColors.deleteNotificationColorLight
                : notificationModel.positive
                ? AppColors
                .updateNotificationColorDark // Dark theme - Dark green color for update notifications
                : AppColors.deleteNotificationColorDark
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Movie: ${notificationModel.title}',
                style: context.textTheme.titleSmall!.copyWith(
                    color: AppColors.white)),
            Text(notificationModel.message,
              style: context.textTheme.bodySmall!.copyWith(
                  color: AppColors.white),)
          ],
        ),
      ),
    );
  }
}
