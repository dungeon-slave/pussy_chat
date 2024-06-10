import 'package:flutter/material.dart';
import 'package:ui_kit/message_widget/components/message_actions.dart';
import 'package:ui_kit/message_widget/components/message_container.dart';
import 'package:ui_kit/message_widget/components/message_sender.dart';
import 'package:ui_kit/message_widget/components/message_text.dart';
import 'package:ui_kit/message_widget/message_widget_config.dart';

class MessageWidget extends StatelessWidget {
  final String text;
  final String time;
  final String userName;
  final bool isMyMessage;
  final MessageWidgetConfig config;

  final Widget? messageStatusWidget;

  const MessageWidget({
    required this.text,
    required this.time,
    required this.isMyMessage,
    required this.config,
    this.messageStatusWidget,
    this.userName = 'Undefined',
  });

  @override
  Widget build(BuildContext context) {
    return MessageContainer(
      sentMessageBackgroundColor: config.sentMessageBackgroundColor,
      receivedMessageBackgroundColor: config.receivedMessageBackgroundColor,
      isSent: isMyMessage,
      content: IntrinsicWidth(
        child: Column(
          children: <Widget>[
            if (!isMyMessage)
              MessageSender(
                senderName: userName,
                textStyle: config.senderTextStyle,
              ),
            MessageText(
              text: text,
              textStyle: config.messageTextStyle,
            ),
            MessageActions(
              time: time,
              status: messageStatusWidget,
              timeTextStyle: config.timeTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
