import 'package:flutter/material.dart';

class MessageText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;

  const MessageText({
    required this.text,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
