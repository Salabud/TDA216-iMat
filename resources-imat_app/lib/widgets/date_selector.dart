import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/widgets/kalender.dart';

class DateSelector extends StatelessWidget {
  const DateSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color.fromARGB(255, 241, 241, 241),
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            LeveransTitle(),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 14, 0, 0),
              child: Transform.scale(
                scale:0.95,
                child: SizedBox(height: 400, width: 400, child: Kalender())
              )
            ),
            Padding(
              padding:EdgeInsets.fromLTRB(0, 17, 0, 0),
              child: Padding(
                padding:EdgeInsets.fromLTRB(115, 0, 195, 0),
                child: Column(
                  children: [
                    DatumInput(),
                    SizedBox(height:15),
                    TidInput(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LeveransTitle extends StatelessWidget {
  const LeveransTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Leverans",
        style: GoogleFonts.notoSans(
          fontSize: 40,
          color: AppTheme.offBlack,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class DatumInput extends StatelessWidget {
  const DatumInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Datum: ",
          style: GoogleFonts.openSans(
            fontSize: 20,
            color: AppTheme.offBlack,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          width: 146,
          child: TextField(
            decoration: InputDecoration(
              hintText: "2022-04-07",
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
    );
  }
}

class TidInput extends StatelessWidget {
  const TidInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Tid: ",
          style: GoogleFonts.openSans(
            fontSize: 20,
            color: AppTheme.offBlack,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 66,
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: "12",
              filled: true,
              fillColor: const Color(0xFFD9D9D9),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            ":",
            style: GoogleFonts.openSans(
              fontSize: 20,
              color: AppTheme.offBlack,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          width: 66,
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: "07",
              filled: true,
              fillColor: const Color(0xFFD9D9D9),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
