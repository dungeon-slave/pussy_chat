import 'package:flutter/material.dart';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'my_app.dart';

void main() async {

  ///TODO (Matvey Vaileuskiy) : move this logic from main
  ///ONLY FOR TEST
  final String url = 'ws://10.201.33.224:4040/';
  final Uri wsUri = Uri.parse(url);
  final WebSocketChannel channel = WebSocketChannel.connect(wsUri);

  await channel.ready;

  // channel.stream.listen(
  //   (message) {
  //     channel.sink.add('received!');
  //     channel.sink.close(status.goingAway);
  //   },
  // );

  ///

  runApp(
    MyApp(
      webSocketStream: channel.stream,
    ),
  );
}
