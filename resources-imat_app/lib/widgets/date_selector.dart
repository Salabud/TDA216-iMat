import 'package:flutter/material.dart';

class DateSelector extends StatelessWidget {
  const DateSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.lightGreenAccent,
        height: double.infinity,
        child:Text("DateSelector")
      ),
    );
  }
}