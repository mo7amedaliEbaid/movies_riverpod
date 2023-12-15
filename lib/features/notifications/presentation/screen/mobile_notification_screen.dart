import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_riverpod/core/extensions/build_context_extensions.dart';
import 'package:movies_riverpod/features/notifications/presentation/provider/notification_provider.dart';
import 'package:movies_riverpod/features/notifications/presentation/widget/notification_item.dart';

import '../../../../core/app/app_dimensions.dart';
import '../../../../core/responsive/responsive.dart';

void mobileNotificationBottomSheet(BuildContext context) {
  double height = MediaQuery.sizeOf(context).height;
  double width = MediaQuery.sizeOf(context).width;
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    constraints: Responsive.isDesktop(context)
        ? BoxConstraints(maxHeight: height * 0.85, maxWidth: width * 0.7)
        : const BoxConstraints(),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
    ),
    builder: (BuildContext context) {
      return Consumer(
        builder: (context, ref, child) {
          Future(() {
            ref.read(notificationStateProvider.notifier).getAllNotifications();
          });
          final notificationsNotifier = ref.watch(notificationStateProvider);
          return ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20.0)),
            child: SizedBox(
                height: height * 0.7,
                child: CustomScrollView(slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Notifications',
                            style: context.textTheme.titleMedium,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                              onTap: () {
                                if (notificationsNotifier
                                    .notifications.isNotEmpty) {
                                  ref
                                      .read(notificationStateProvider.notifier)
                                      .clearNotifications();
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: AppDimensions.p10,
                                    right: AppDimensions.p12,
                                    bottom: AppDimensions.p12,
                                    left: AppDimensions.p12),
                                child: Text('Clear All',
                                    style: context.textTheme.bodySmall),
                              )),
                        )
                      ],
                    ),
                  ),
                  notificationsNotifier.notifications.isNotEmpty
                      ? SliverList(
                          delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return NotificationItem(
                                notificationModel:
                                    notificationsNotifier.notifications[index]);
                          },
                          childCount:
                              notificationsNotifier.notifications.length,
                        ))
                      : const SliverFillRemaining(
                          child: Center(
                            child: Text('No notification available'),
                          ),
                        )
                ])),
          );
        },
      );
    },
  );
}

