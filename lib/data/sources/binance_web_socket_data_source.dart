import 'dart:async';

import 'package:web_socket_channel/web_socket_channel.dart';

class BinanceWebSocketDataSource {
  WebSocketChannel? _channel;
  StreamController<String>? _streamController;

  void connect(String url) {
    disconnect();
    _streamController = StreamController<String>.broadcast();
    _channel = WebSocketChannel.connect(Uri.parse(url));
    _channel!.stream.listen(
      (data) => _streamController?.add(data),
      onError: (e) => _streamController?.addError(e),
      onDone: () => _streamController?.close(),
      cancelOnError: false,
    );
  }

  void disconnect() {
    _channel?.sink.close();
    _channel = null;
    _streamController?.close();
    _streamController = null;
  }

  Stream<String> get stream => _streamController!.stream;
}
