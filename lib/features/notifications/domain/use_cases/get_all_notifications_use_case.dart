import 'package:dartz/dartz.dart';
import 'package:movies_riverpod/features/notifications/data/models/notification.dart';
import 'package:movies_riverpod/features/notifications/domain/repository/notifications_repository.dart';

import '../../../../core/util/app_exception.dart';

interface class GetAllNotificationsUseCase {
  final NotificationRepository notificationRepository;

  GetAllNotificationsUseCase({required this.notificationRepository});

  Future<Either<AppException, List<NotificationModel>>> execute() async {
    return notificationRepository.getNotifications();
  }
}
