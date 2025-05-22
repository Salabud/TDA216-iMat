import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/pages/main_view.dart';
import 'package:imat_app/widgets/previous_button.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.fromLTRB(80, 20, 30, 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PersonUppgifter(),
              KortUppgifter(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [PreviousButton(page:MainView(),label:"Tillbaka"), CreditCard()],
              ),
            ],
          ),
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
      width: 170,
      height: 90,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Personuppgifter",
          style: GoogleFonts.openSans(
            fontSize: 40,
            color: AppTheme.offBlack,
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
        Text(
          "Kortuppgifter",
          style: GoogleFonts.openSans(
            fontSize: 40,
            color: AppTheme.offBlack,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              flex:7,
              child: TextField(
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
            ),
            SizedBox(width:16),
            Expanded(
              flex: 3,
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
            
          ]
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex:7,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Korthavare",
                  filled: true,
                  fillColor: Color(0xFFD9D9D9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(width:16),
            Expanded(
              flex: 3,
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
          ],
        ),
      ],
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
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => const MainView(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return child; // Just return the child without any animation
              },
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
        },
        child: Container(
          width: 250,
          height:90,
          decoration: BoxDecoration(
            color: AppTheme.red,
            borderRadius: BorderRadius.all((Radius.circular(15))),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back_ios_rounded,color:AppTheme.darkRed,size:35),
              Text("  Tillbaka", 
                style:TextStyle(
                  color:Colors.white,
                  fontFamily:'MadimiOne',
                  fontSize:40,
                  fontWeight:FontWeight.w500
                )
              ),
            ],
          )
        ),
        
      ),
    );
  }
}
