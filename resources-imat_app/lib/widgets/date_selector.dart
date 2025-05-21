import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imat_app/widgets/kalender.dart';

class DateSelector extends StatelessWidget {
  const DateSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Color(0xFFFFFFFF),
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            LeveransTitle(),
            SizedBox(height: 30),
            SizedBox(height: 400, width: 500, child: Kalender()),
            SizedBox(height: 40),
            DatumInput(),
            SizedBox(height: 40),
            TidInput(),
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
          fontSize: 54,
          color: Color(0xFF414141),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

//class Kalender extends StatelessWidget {
// const Kalender({super.key});
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(width: 300, height: 300, color: Colors.blue);
//  }
//}

class DatumInput extends StatelessWidget {
  const DatumInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Datum: ",
            style: GoogleFonts.notoSans(
              fontSize: 20,
              color: Color(0xFF414141),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: 250,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Tid: ",
            style: GoogleFonts.notoSans(
              fontSize: 20,
              color: Color(0xFF414141),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: 50,
            child: TextField(
              decoration: InputDecoration(
                hintText: "12",
                filled: true,
                fillColor: Color(0xFFD9D9D9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Text(
            " : ",
            style: GoogleFonts.notoSans(
              fontSize: 20,
              color: Color(0xFF414141),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: 50,
            child: TextField(
              decoration: InputDecoration(
                hintText: "07",
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
    );
  }
}
