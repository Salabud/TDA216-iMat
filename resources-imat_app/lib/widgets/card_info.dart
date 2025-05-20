import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.greenAccent,
        height: double.infinity,
        child: Text("DateSelector")
      ),
    );
  }
}