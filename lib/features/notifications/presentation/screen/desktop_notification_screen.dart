import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_riverpod/core/extensions/build_context_extensions.dart';

import '../../../../core/app/app_dimensions.dart';
import '../provider/notification_provider.dart';
import '../widget/notification_item.dart';

void desktopNotificationSideSheet(BuildContext context) {
  // double height = MediaQuery.sizeOf(context).height;
  double width = MediaQuery.sizeOf(context).width;
  showGeneralDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.5),
    barrierDismissible: true,
    barrierLabel: '',
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset(0.0, 0.0);
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      var offsetAnimation = animation.drive(tween);
      return SlideTransition(position: offsetAnimation, child: child);
    },
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          width: width * .25,
          child: Material(
            child: Consumer(
              builder: (context, ref, child) {
                Future(() {
                  ref
                      .read(notificationStateProvider.notifier)
                      .getAllNotifications();
                });
                final notificationsNotifier =
                ref.watch(notificationStateProvider);
                return ClipRRect(
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(20.0)),
                  child: CustomScrollView(
                    slivers: [
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
                                        .read(
                                        notificationStateProvider.notifier)
                                        .clearNotifications();
                                  }
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: AppDimensions.p10,
                                    right: AppDimensions.p12,
                                    bottom: AppDimensions.p12,
                                    left: AppDimensions.p12,
                                  ),
                                  child: Text('Clear All',
                                      style: context.textTheme.bodySmall),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      notificationsNotifier.notifications.isNotEmpty
                          ? SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (context, index) {
                            return NotificationItem(
                              notificationModel: notificationsNotifier
                                  .notifications[index],
                            );
                          },
                          childCount:
                          notificationsNotifier.notifications.length,
                        ),
                      )
                          : const SliverFillRemaining(
                        child: Center(
                          child: Text('No notification available'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      );
    },
  );
}