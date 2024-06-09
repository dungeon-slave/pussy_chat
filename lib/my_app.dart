import 'dart:async';

import 'package:flutter/material.dart';

import 'package:core_ui/screens/chats_screen.dart';
import 'package:domain/models/chat_model.dart';
import 'package:domain/models/message_model.dart';
import 'package:domain/enums/message_status_enum.dart';

import 'dart:convert';

class MyApp extends StatefulWidget {
  final Stream webSocketStream;

  const MyApp({
    required this.webSocketStream,
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //final List<Timer> chatTimers = <Timer>[];
  final List<ChatModel<MessageModel>> chats = [];
  StreamSubscription? socketSubscription;

  @override
  void initState() {
    super.initState();

    socketSubscription = _getSocketSubscription(
      () => setState(() {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Builder(
        builder: (BuildContext context) {
          if (chats.isEmpty) {
            return CircularProgressIndicator();
          } else {
            return ChatsScreen(title: 'Chats', chats: chats);
          }
        },
      ),
    );
  }

  StreamSubscription _getSocketSubscription(
    VoidCallback setStateHandler,
  ) {
    return widget.webSocketStream.listen(
      (message) async {
        final result = jsonDecode(message);
        final int messageType = result['MessageType'];

        if (messageType == 0) {
          for (final chat in result['Chats']) {
            chats.add(
              ChatModel(
                name: (chat as Map<String, dynamic>).entries.first.value,
                messagesStreamController: StreamController.broadcast(),
              ),
            );
          }
        } else {
          final chat = chats
              .where(
                (element) => element.name == result['ChatName'],
              )
              .first;

          chat.messagesStreamController.add(
            MessageModel(
              userName: result['ChatName'],
              text: result['Message'],
              isMyMessage: result['IsUserMessage'],
              dateTime: DateTime.now(),
              status: MessageStatus.read,
            ),
          );
        }

        setStateHandler();
      },
    );
  }
}
