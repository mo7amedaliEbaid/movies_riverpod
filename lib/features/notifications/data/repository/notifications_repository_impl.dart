import 'package:dartz/dartz.dart';
import 'package:movies_riverpod/features/notifications/data/datasource/local/notifications_local_datasource.dart';
import 'package:movies_riverpod/features/notifications/data/models/notification.dart';
import 'package:movies_riverpod/features/notifications/domain/repository/notifications_repository.dart';

import '../../../../core/util/app_exception.dart';

interface class NotificationRepoImpl extends NotificationRepository {
  NotificationsLocalDataSource notificationsLocalDataSource;

  NotificationRepoImpl({required this.notificationsLocalDataSource});

  @override
  Future<void> clearNotifications() {
    return notificationsLocalDataSource.clearNotifications();
  }

  @override
  Future<Either<AppException, List<NotificationModel>>> getNotifications() {
    return notificationsLocalDataSource.getNotifications();
  }
}
