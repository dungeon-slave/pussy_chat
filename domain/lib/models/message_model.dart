import '../enums/message_status_enum.dart';

class MessageModel {
  final String userName;
  final String text;
  final DateTime dateTime;
  final MessageStatus status;
  final bool isMyMessage;

  const MessageModel({
    required this.userName,
    required this.text,
    required this.dateTime,
    required this.status,
    required this.isMyMessage,
  });
}
