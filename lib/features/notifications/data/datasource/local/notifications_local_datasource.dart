import 'package:dartz/dartz.dart';
import 'package:movies_riverpod/features/notifications/data/models/notification.dart';
import 'package:movies_riverpod/shared/util/app_exception.dart';

abstract class NotificationsLocalDataSource {
  Future<Either<AppException, List<NotificationModel>>> getNotifications();

  Future<void> clearNotifications();
}
