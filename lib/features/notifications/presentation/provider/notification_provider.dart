import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_riverpod/features/notifications/presentation/provider/state/notification_state.dart';
import 'package:movies_riverpod/features/notifications/presentation/provider/state/notifications_notifier.dart';

final notificationStateProvider =
AutoDisposeStateNotifierProvider<NotificationNotifier, NotificationState>(
        (ref) => NotificationNotifier());