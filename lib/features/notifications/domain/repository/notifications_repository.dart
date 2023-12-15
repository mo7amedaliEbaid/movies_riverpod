import 'package:dartz/dartz.dart';
import 'package:movies_riverpod/features/notifications/data/models/notification.dart';
import '../../../../core/util/app_exception.dart';

abstract class NotificationRepository{
  Future<Either<AppException, List<NotificationModel>>> getNotifications();

  Future<void> clearNotifications();
}

