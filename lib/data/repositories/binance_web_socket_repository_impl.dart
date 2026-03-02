import 'package:binance_mvvm/data/sources/binance_web_socket_data_source.dart';
import 'package:binance_mvvm/domain/repositories/binance_web_socket_repository.dart';

class BinanceWebSocketRepositoryImpl implements BinanceWebSocketRepository {
  final BinanceWebSocketDataSource _dataSource;

  BinanceWebSocketRepositoryImpl({
    required BinanceWebSocketDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  void connect(String url) {
    _dataSource.connect(url);
  }

  @override
  void disconnect() {
    _dataSource.disconnect();
  }

  @override
  Stream<String> get stream => _dataSource.stream;
}
