import 'package:flutter/material.dart';
import 'package:ui_kit/message_widget/components/message_actions.dart';
import 'package:ui_kit/message_widget/components/message_container.dart';
import 'package:ui_kit/message_widget/components/message_sender.dart';
import 'package:ui_kit/message_widget/components/message_text.dart';

class MessageWidget extends StatelessWidget {
  final String text;
  final String time;
  final String userName;
  final bool isMyMessage;
  final Widget? messageStatusWidget;

  const MessageWidget({
    required this.text,
    required this.time,
    required this.isMyMessage,
    this.messageStatusWidget,
    this.userName = 'Undefined',
  });

  @override
  Widget build(BuildContext context) {
    return MessageContainer(
      isSent: isMyMessage,
      content: IntrinsicWidth(
        child: Column(
          children: <Widget>[
            if (!isMyMessage) MessageSender(senderName: userName),
            MessageText(text: text),
            MessageActions(time: time, status: messageStatusWidget,),
          ],
        ),
      ),
    );
  }
}
