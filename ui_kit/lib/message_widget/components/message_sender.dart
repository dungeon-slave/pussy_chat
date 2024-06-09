import 'package:flutter/material.dart';

class MessageSender extends StatelessWidget {
  final String senderName;

  const MessageSender({
    required this.senderName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          senderName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
