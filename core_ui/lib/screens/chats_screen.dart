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
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
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
          Padding(
            padding: const EdgeInsets.only(bottom: 50, right: 50),
            child: Align(
              alignment: Alignment.bottomRight,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber,
                ),
                child: MaterialButton(
                  shape: CircleBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(Icons.add, size: 50,),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
