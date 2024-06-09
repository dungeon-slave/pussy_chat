import 'package:flutter/material.dart';

class ChatIndicationZone extends StatelessWidget {
  final Size size;
  final int unreadMessagesCount;
  final TextStyle style;

  const ChatIndicationZone({
    required this.size,
    required this.unreadMessagesCount, required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.2,
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          unreadMessagesCount.toString(),
          style: style.copyWith(color: Colors.amberAccent),
        ),
      ),
    );
  }
}