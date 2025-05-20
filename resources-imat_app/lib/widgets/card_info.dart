import 'package:flutter/material.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/pages/main_view.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.greenAccent,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          PersonUppgifter(),
          KortUppgifter(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TillbakaKnapp(),
              CreditCard(),
            ],
          )
      ],)
      ),
    );
  }
}

class CreditCard extends StatelessWidget {
  const CreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      child:Text("Creditcard picture here")
    );
  }
}


class PersonUppgifter extends StatelessWidget {
  const PersonUppgifter({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Personuppgifter",
          style: TextStyle(
            fontSize: 36,
          ),
        ),
        const SizedBox(height: 20),
        const DoubleFieldRow(label1: "Förnamn", label2: "Efternamn"),
        const DoubleFieldRow(label1: "Adress", label2: "Postnummer"),
        const DoubleFieldRow(label1: "Ort", label2: "Telefonnummer"),

      ],
    );
  }
}

class KortUppgifter extends StatelessWidget {
  const KortUppgifter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Kortuppgifter",
          style: TextStyle(
            fontSize: 36,
          ),
        ),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Kortnummer",
            hintText: "1234 5678 9012 3456",
            border: OutlineInputBorder(),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child:TextField(
                decoration: InputDecoration(
                  labelText: "Utgångsdatum",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    labelText: "CVC",
                    border: OutlineInputBorder()
                ),
              )
            ),
          ],
        )
      ],
    );
  }
}


class TillbakaKnapp extends StatelessWidget {
  const TillbakaKnapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click ,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MainView()),
          );
        },
        child: Container(
          height:75,
          color: AppTheme.red,
          child: Text("Tillbaka")
        ),
        
      ),
    );
  }
}

class DoubleFieldRow extends StatelessWidget {
  final String label1;
  final String label2;

  const DoubleFieldRow({
    super.key,
    required this.label1,
    required this.label2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: label1,
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: label2,
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}