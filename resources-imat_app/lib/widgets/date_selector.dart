import 'package:flutter/material.dart';

class DateSelector extends StatelessWidget {
  const DateSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.lightGreenAccent,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LeveransTitle(),
            Kalender(),
            DatumInput(),
            TidInput(),
          ],
        )
      ),
    );
  }
}

class LeveransTitle extends StatelessWidget {
  const LeveransTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      const Text(
        "Leverans",
        style: TextStyle(
          fontSize: 32,
        ),
      )
    );
  }
}

class Kalender extends StatelessWidget {
  const Kalender({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      color: Colors.blue,
    );
  }
}

class DatumInput extends StatelessWidget {
  const DatumInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      child: Row(
        children: [
          Text("Datum: "),
          Expanded(child:TextField(
            decoration: InputDecoration(
              labelText: "2022-04-07",
                border: OutlineInputBorder(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TidInput extends StatelessWidget {
  const TidInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      child: Row(
        children: [
          Text("Tid: "),
          Expanded(child:TextField(
            decoration: InputDecoration(
              labelText: "12",
              border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(child: TextField(
            decoration: InputDecoration(
              labelText: "07",
              border: OutlineInputBorder(),
            ),
          ),)
        ],
      ),
    );
  }
}