import 'package:flutter_riverpod/flutter_riverpod.dart';

final messageQueueProvider = StateNotifierProvider<MessageQueue, List<String>>((ref) {
  return MessageQueue();
});

interface class MessageQueue extends StateNotifier<List<String>> {
  MessageQueue() : super([]);

  void addMessage(String message) {
    state = [...state, message];
  }

  void clearMessages() {
    state = [];
  }
}
