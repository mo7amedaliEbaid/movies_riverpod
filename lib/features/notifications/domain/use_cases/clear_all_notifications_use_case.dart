import 'package:movies_riverpod/features/notifications/domain/repository/notifications_repository.dart';

interface class ClearAllNotificationsUseCase {
  final NotificationRepository notificationRepository;

  ClearAllNotificationsUseCase({required this.notificationRepository});

  Future<void> execute() async {
    return notificationRepository.clearNotifications();
  }
}