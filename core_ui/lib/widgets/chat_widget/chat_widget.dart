import 'dart:async';

import 'package:flutter/material.dart';

import 'package:domain/models/chat_model.dart';

import 'chat_indication_zone.dart';

//TODO : think about moving it into ui_kit
class ChatWidget<T> extends StatefulWidget {
  static const TextStyle style = TextStyle(fontSize: 25);

  final ChatModel<T> model;
  final VoidCallback tapHandler;
  final Size? size;

  const ChatWidget({
    required this.model,
    required this.tapHandler,
    this.size,
    super.key,
  });

  @override
  State<ChatWidget<T>> createState() => _ChatWidgetState<T>();
}

class _ChatWidgetState<T> extends State<ChatWidget<T>> {
  StreamSubscription<T>? subscription;

  @override
  void initState() {
    super.initState();
    subscription = widget.model.messagesStreamController.stream.listen(
      (T event) {
        setState(
          () => widget.model.items.add(event),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size currSize;

    if (widget.size == null) {
      final Size screenSize = MediaQuery.sizeOf(context);

      currSize = Size(screenSize.width, screenSize.height);
    } else {
      currSize = widget.size!;
    }

    return GestureDetector(
      onTap: widget.tapHandler,
      child: Container(
        height: currSize.height / 4,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          color: Colors.black12,
        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: currSize.width * 0.7,
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        widget.model.name,
                        style: ChatWidget.style,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ChatIndicationZone(
              size: currSize,
              unreadMessagesCount: widget.model.items.length,
              style: ChatWidget.style,
            ),
          ],
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
