import 'package:binance_mvvm/ui/widgets/navigate_button.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Binance"), centerTitle: true),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [NavigateButton(text: "Riverpod", onPressed: () {})],
        ),
      ),
    );
  }
}
