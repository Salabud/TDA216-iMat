import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const double kundvagnWidth = 300;
const double kvittoWidth = 250;

class Kundvagn extends StatelessWidget {
  const Kundvagn({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      width: kundvagnWidth,
      height: double.infinity,
      child: Column(
        children: [
          KundvagnKvitto(),
          SizedBox(height: 25),
          KassaKnapp(),
          SizedBox(height:25)
        ],
      ),
    );
  }
}

class KassaKnapp extends StatelessWidget {
  const KassaKnapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kvittoWidth,
      height:75,
      color: const Color.fromARGB(255, 120, 167, 255),
      child: Text("kassaknapp")
    );
  }
}

class KundvagnKvitto extends StatelessWidget {
  const KundvagnKvitto({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: kvittoWidth,
        color: const Color.fromARGB(255, 223, 41, 255),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KundvagnInnehall(),
            Spacer(),
            KundvagnTotal()
          ],
        )
      ),
    );
  }
}

class KundvagnInnehall extends StatelessWidget {
  const KundvagnInnehall({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 107, 208, 255),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Kundvagn", style:TextStyle(fontSize: 25)),
          KundvagnItem(),
          KundvagnItem(),
          KundvagnItem(),
          //TODO: Lista med flera KundvagnItem() som tas från shopping cart API
        ],
      )
    );
  }
}

class KundvagnTotal extends StatelessWidget {
  const KundvagnTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      height:75,
      color: const Color.fromARGB(255, 117, 255, 250),
      child: Text("Total")
    );
  }
}

class KundvagnItem extends StatelessWidget {
  const KundvagnItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      color: Colors.blue,
      child:Text("Kundvagn item")
    );
  }
}