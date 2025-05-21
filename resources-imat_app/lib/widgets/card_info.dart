import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/pages/main_view.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Color(0xFFFFFFFF),
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PersonUppgifter(),
            KortUppgifter(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [TillbakaKnapp(), CreditCard()],
            ),
          ],
        ),
      ),
    );
  }
}

class CreditCard extends StatelessWidget {
  const CreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 110,
      decoration: BoxDecoration(
        color: Color(0xFF4D597E), // The blue card background
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "COOLBANK AB",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 8,
                  backgroundColor: Color(0xFFFFA43C), // orange
                ),
                SizedBox(width: 4),
                CircleAvatar(
                  radius: 8,
                  backgroundColor: Color(0xFFFA453C), // red
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PersonUppgifter extends StatelessWidget {
  const PersonUppgifter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 40, 50, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Personuppgifter",
            style: GoogleFonts.notoSans(
              fontSize: 54,
              color: Color(0xFF414141),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 24),
          const DoubleFieldRow(label1: "Förnamn", label2: "Efternamn"),
          const SizedBox(height: 16),
          const DoubleFieldRow(label1: "Adress", label2: "Postnummer"),
          const SizedBox(height: 16),
          const DoubleFieldRow(label1: "Ort", label2: "Telefonnummer"),
        ],
      ),
    );
  }
}

class KortUppgifter extends StatelessWidget {
  const KortUppgifter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 40, 50, 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Kortuppgifter",
            style: GoogleFonts.notoSans(
              fontSize: 54,
              color: Color(0xFF414141),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 24),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Kortnummer",
              hintText: "1234 5678 9012 3456",
              filled: true,
              fillColor: Color(0xFFD9D9D9),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 16),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Utgångsdatum",
                    filled: true,
                    fillColor: Color(0xFFD9D9D9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              Expanded(
                flex: 1,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "CVC",
                    filled: true,
                    fillColor: Color(0xFFD9D9D9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TillbakaKnapp extends StatelessWidget {
  const TillbakaKnapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder:
                  (context, animation, secondaryAnimation) => const MainView(),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                return child; // Just return the child without any animation
              },
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
        },
        child: Container(
          height: 75,
          color: AppTheme.red,
          child: Text("Tillbaka"),
        ),
      ),
    );
  }
}

class DoubleFieldRow extends StatelessWidget {
  final String label1;
  final String label2;

  const DoubleFieldRow({super.key, required this.label1, required this.label2});

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
                filled: true,
                fillColor: Color(0xFFD9D9D9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
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
                filled: true,
                fillColor: Color(0xFFD9D9D9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
