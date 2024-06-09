import 'package:flutter/material.dart';

import 'package:domain/models/message_model.dart';
import 'package:domain/models/chat_model.dart';

import '../widgets/chat_widget/chat_widget.dart';
import 'chat_screen.dart';


class ChatsScreen extends StatelessWidget {
  final String title;
  final List<ChatModel<MessageModel>> chats;

  const ChatsScreen({
    required this.title,
    required this.chats,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final NavigatorState navigator = Navigator.of(context);
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: themeData.colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            chats.length,
            (int index) {
              return ChatWidget<MessageModel>(
                model: chats[index],
                tapHandler: () {
                  navigator.push(
                    MaterialPageRoute(
                      builder: (_) => ChatScreen(model: chats[index]),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
