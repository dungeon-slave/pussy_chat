import 'package:flutter/material.dart';

//TODO (Matvey Vasileuskiy) : finalize message actions
class MessageActions extends StatelessWidget {
  final String time;
  final Widget? status;

  const MessageActions({
    required this.time,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(time),
          if (status != null) status!,
        ],
      ),
    );
  }
}
