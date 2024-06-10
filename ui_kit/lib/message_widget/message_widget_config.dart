import 'package:flutter/material.dart';

class MessageWidgetConfig {
  final TextStyle senderTextStyle;
  final TextStyle messageTextStyle;
  final TextStyle timeTextStyle;
  final Color sentMessageBackgroundColor;
  final Color receivedMessageBackgroundColor;

  const MessageWidgetConfig({
    required this.senderTextStyle,
    required this.messageTextStyle,
    required this.timeTextStyle,
    required this.sentMessageBackgroundColor,
    required this.receivedMessageBackgroundColor,
  });

  MessageWidgetConfig copyWith({
    TextStyle? userNameTextStyle,
    TextStyle? messageTextStyle,
    TextStyle? timeTextStyle,
    Color? sentMessageBackgroundColor,
    Color? receivedMessageBackgroundColor,
  }) {
    return MessageWidgetConfig(
      senderTextStyle: userNameTextStyle ?? this.senderTextStyle,
      messageTextStyle: messageTextStyle ?? this.messageTextStyle,
      timeTextStyle: timeTextStyle ?? this.timeTextStyle,
      sentMessageBackgroundColor:
          sentMessageBackgroundColor ?? this.sentMessageBackgroundColor,
      receivedMessageBackgroundColor:
          receivedMessageBackgroundColor ?? this.receivedMessageBackgroundColor,
    );
  }
}
