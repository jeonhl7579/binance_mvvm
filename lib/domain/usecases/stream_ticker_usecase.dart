import 'package:binance_mvvm/domain/repositories/binance_web_socket_repository.dart';

class StreamTickerUseCase {
  final BinanceWebSocketRepository _repository;

  StreamTickerUseCase(this._repository);

  Stream<String> execute(String url) {
    _repository.connect(url);
    return _repository.stream;
  }
}
