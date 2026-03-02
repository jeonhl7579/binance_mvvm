import 'package:binance_mvvm/presentation/providers/binance_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodBinanceViewModel extends Notifier<AsyncValue<String>> {
  @override
  AsyncValue<String> build() {
    return ref.watch(tickerStreamProvider);
  }
}

final riverpodBinanceViewModelProvider =
    NotifierProvider<RiverpodBinanceViewModel, AsyncValue<String>>(
  RiverpodBinanceViewModel.new,
  isAutoDispose: true,
);
