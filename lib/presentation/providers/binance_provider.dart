import 'package:binance_mvvm/data/repositories/binance_web_socket_repository_impl.dart';
import 'package:binance_mvvm/data/sources/binance_web_socket_data_source.dart';
import 'package:binance_mvvm/domain/repositories/binance_web_socket_repository.dart';
import 'package:binance_mvvm/domain/usecases/stream_ticker_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _btcTickerUrl = 'wss://stream.binance.com:9443/ws/btcusdt@ticker';

final binanceWebSocketDataSourceProvider = Provider<BinanceWebSocketDataSource>(
  (ref) {
    return BinanceWebSocketDataSource();
  },
);

final binanceWebSocketRepositoryProvider = Provider<BinanceWebSocketRepository>(
  (ref) {
    return BinanceWebSocketRepositoryImpl(
      dataSource: ref.watch(binanceWebSocketDataSourceProvider),
    );
  },
);

final streamTickerUseCaseProvider = Provider<StreamTickerUseCase>((ref) {
  return StreamTickerUseCase(ref.watch(binanceWebSocketRepositoryProvider));
});

final tickerStreamProvider = StreamProvider.autoDispose<String>((ref) {
  final useCase = ref.watch(streamTickerUseCaseProvider);
  final repository = ref.watch(binanceWebSocketRepositoryProvider);
  final stream = useCase.execute(_btcTickerUrl);
  ref.onDispose(() => repository.disconnect());
  return stream;
});
