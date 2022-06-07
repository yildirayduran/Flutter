import 'package:flutter/material.dart';

class TitleWidgets extends StatelessWidget {
  const TitleWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Todo App",
      style: TextStyle(
          fontSize: 80, fontWeight: FontWeight.w100, color: Colors.orange),
    );
  }
}
