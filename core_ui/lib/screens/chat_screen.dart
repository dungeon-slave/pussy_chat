import 'dart:async';

import 'package:flutter/material.dart';

import 'package:domain/models/message_model.dart';
import 'package:domain/models/chat_model.dart';
import 'package:domain/enums/message_status_enum.dart';
import 'package:core/date_time_extension.dart';

import 'package:ui_kit/message_widget/message_widget.dart';

class ChatScreen<T extends MessageModel> extends StatefulWidget {
  final ChatModel<T> model;

  const ChatScreen({
    required this.model,
    super.key,
  });

  @override
  State<ChatScreen<T>> createState() => _ChatScreenState<T>();
}

class _ChatScreenState<T extends MessageModel> extends State<ChatScreen<T>> {
  StreamSubscription<T>? subscription;

  @override
  void initState() {
    super.initState();
    subscription ??= widget.model.messagesStreamController.stream.listen(
      (_) => setState(() {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.teal,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Column(
              children: <Widget>[
                for (final T item in widget.model.items)
                  MessageWidget(
                    text: item.text,
                    time: item.dateTime.extractHoursAndMinutes(),
                    messageStatusWidget: item.isMyMessage
                        ? MessageStatusMatchService.getStatusIcon(item.status)
                        : null,
                    userName: item.userName,
                    isMyMessage: item.isMyMessage,
                  ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: Navigator.of(context).pop,
          child: const Text('Back'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }
}

abstract class MessageStatusMatchService {
  static Icon getStatusIcon(MessageStatus status) {
    final IconData iconData;

    switch (status) {
      case MessageStatus.read:
        {
          iconData = Icons.check_circle;
        }
      case MessageStatus.notSent:
        {
          iconData = Icons.error;
        }
      case MessageStatus.sent:
        {
          iconData = Icons.check_circle_outline;
        }
      case MessageStatus.tryingToSent:
        {
          iconData = Icons.timer;
        }
    }

    return Icon(iconData);
  }
}
