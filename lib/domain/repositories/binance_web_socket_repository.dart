abstract class BinanceWebSocketRepository {
  void connect(String url);
  void disconnect();
  Stream<String> get stream;
}
