import 'package:flutter/material.dart';

class NavigateButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const NavigateButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
