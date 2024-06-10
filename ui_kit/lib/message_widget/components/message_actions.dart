import 'package:flutter/material.dart';

//TODO (Matvey Vasileuskiy) : finalize message actions
class MessageActions extends StatelessWidget {
  final String time;
  final TextStyle timeTextStyle;
  final Widget? status;

  const MessageActions({
    required this.time,
    required this.timeTextStyle,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            time,
            style: timeTextStyle,
          ),
          if (status != null) status!,
        ],
      ),
    );
  }
}
