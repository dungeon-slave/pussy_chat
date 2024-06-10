import 'package:flutter/material.dart';

class MessageSender extends StatelessWidget {
  final String senderName;
  final TextStyle textStyle;

  const MessageSender({
    required this.senderName,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          senderName,
          style: textStyle,
        ),
      ),
    );
  }
}
