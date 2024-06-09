import 'dart:async';

class ChatModel<T> {
  final String name;
  final StreamController<T> messagesStreamController;
  List<T> items = <T>[];

  ChatModel({
    required this.name,
    required this.messagesStreamController,
  });
}
