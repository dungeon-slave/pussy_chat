import 'package:flutter/material.dart';

class MessageContainer extends StatelessWidget {
  final Widget content;
  final bool isSent;
  final Color sentMessageBackgroundColor;
  final Color receivedMessageBackgroundColor;

  const MessageContainer({
    required this.content,
    required this.isSent,
    required this.sentMessageBackgroundColor,
    required this.receivedMessageBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.6,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 5,
            bottom: 5,
            right: 10,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: isSent
                  ? sentMessageBackgroundColor
                  : receivedMessageBackgroundColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: 3,
              ),
              child: content,
            ),
          ),
        ),
      ),
    );
  }
}
