import 'package:flutter/material.dart';

class BrowseArea extends StatelessWidget {
  const BrowseArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.green,
        child: Text("main browse"),
        height: double.infinity
      ),
    );
  }
}