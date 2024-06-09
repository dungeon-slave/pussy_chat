import 'package:web_socket_channel/web_socket_channel.dart';

///MAYBE BETTER SOLUTION CAN BE CREATE EXTENSION, NOT SERVICE

abstract class WebsocketService {
  static WebSocketChannel getChannel(String url) {
    final Uri uri = Uri.parse(url);

    return WebSocketChannel.connect(uri);
  }

  static Future<WebSocketChannel> getConnectedChannel(String url) async {
    final WebSocketChannel channel = getChannel(url);

    await channel.ready;

    return channel;
  }

  static Future<void> closeChannel(WebSocketChannel channel) {
    return channel.sink.close();
  }
}
