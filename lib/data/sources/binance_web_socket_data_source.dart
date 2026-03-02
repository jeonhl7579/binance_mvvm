import 'dart:async';

import 'package:web_socket_channel/web_socket_channel.dart';

class BinanceWebSocketDataSource {
  WebSocketChannel? _channel;
  // 데이터 스트림 컨트롤러, 타입 바뀔 예정
  final _streamController = StreamController<String>.broadcast();

  void connect(String url) {
    _channel = WebSocketChannel.connect(Uri.parse(url));
    _channel!.stream.listen(
      (data) => _streamController.add(data),
      onError: (e) => _streamController.addError(e),
      onDone: () => _streamController.close(),
      cancelOnError: false,
    );
  }

  void disconnect() {
    _channel?.sink.close();
    _streamController.close();
  }
}
