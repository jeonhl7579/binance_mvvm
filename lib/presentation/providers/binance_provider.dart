import 'package:binance_mvvm/data/repositories/binance_web_socket_repository_impl.dart';
import 'package:binance_mvvm/data/sources/binance_web_socket_data_source.dart';
import 'package:binance_mvvm/domain/repositories/binance_web_socket_repository.dart';
import 'package:binance_mvvm/domain/usecases/stream_ticker_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 통신할 URL 주소
const _btcTickerUrl = 'wss://stream.binance.com:9443/ws/btcusdt@ticker';

// 프로젝트 구조 상 dataSource 레이어에 위치하는 클래스를 사용하기 위해 Provider로 정의
final binanceWebSocketDataSourceProvider = Provider<BinanceWebSocketDataSource>(
  (ref) {
    return BinanceWebSocketDataSource();
  },
);

// 프로젝트 구조 상 repository 레이어에 위치하는 클래스를 사용하기 위해 Provider로 정의
final binanceWebSocketRepositoryProvider = Provider<BinanceWebSocketRepository>(
  (ref) {
    return BinanceWebSocketRepositoryImpl(
      dataSource: ref.read(binanceWebSocketDataSourceProvider),
    );
  },
);

// 프로젝트 구조 상 usecase 레이어에 위치하는 클래스를 사용하기 위해 Provider로 정의
final streamTickerUseCaseProvider = Provider<StreamTickerUseCase>((ref) {
  return StreamTickerUseCase(ref.read(binanceWebSocketRepositoryProvider));
});

// ViewModel에서 사용할 Stream Provider
final tickerStreamProvider = StreamProvider.autoDispose<String>((ref) {
  final useCase = ref.read(streamTickerUseCaseProvider);
  final stream = useCase.execute(_btcTickerUrl);
  ref.onDispose(() => useCase.disconnect());
  return stream;
});


// 이 파일에서 내가 사용할 Provider는 StreamProvider
// 해당 Stream 관련 기능은 useCase를 통해 기능 사용
// useCase를 사용하기 위해서는 Respository를 사용
// Respository를 사용하기 위해 DataSource를 사용
// 그래서 위처럼 4단계의 계층으로 나뉘어짐