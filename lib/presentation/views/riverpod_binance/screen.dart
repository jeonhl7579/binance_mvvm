import 'package:flutter/material.dart';

class RiverPodBinanceScreen extends StatefulWidget {
  const RiverPodBinanceScreen({super.key});

  @override
  State<RiverPodBinanceScreen> createState() => _RiverPodBinanceScreenState();
}

class _RiverPodBinanceScreenState extends State<RiverPodBinanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("Riverpod Binance")),
    );
  }
}
