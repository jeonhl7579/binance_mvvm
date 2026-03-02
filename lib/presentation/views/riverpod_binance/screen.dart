import 'package:binance_mvvm/presentation/viewmodels/riverpod_binance_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverPodBinanceScreen extends ConsumerWidget {
  const RiverPodBinanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(riverpodBinanceViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod Binance')),
      body: state.when(
        data: (data) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 48),
              const SizedBox(height: 16),
              Text('WebSocket 연결됨', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(data, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, color: Colors.red, size: 48),
              const SizedBox(height: 16),
              Text('연결 실패: $error'),
            ],
          ),
        ),
      ),
    );
  }
}
