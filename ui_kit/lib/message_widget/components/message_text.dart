import 'package:flutter/material.dart';

class MessageText extends StatelessWidget {
  final String text;

  const MessageText({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        text,
      ),
    );
  }
}
