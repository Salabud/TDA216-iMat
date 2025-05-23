import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/pages/account_view.dart';
import 'package:imat_app/pages/history_view.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

class HeaderButtons extends StatelessWidget {
  const HeaderButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _headerButton(
          context: context,
          title: 'Kvitton',
          subtitle: 'Mina',
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HistoryView()),
          ),
        ),
        _headerButton(
          context: context,
          title: 'Britta',
          subtitle: 'Inloggad som',
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AccountView()),
          ),
        ),
      ],
    );
  }

Widget _headerButton({
  required BuildContext context,
  required String title,
  required String subtitle,
  required VoidCallback onTap,
}) {
  return Material(
    color: AppTheme.orange,
    child: InkWell(
      onTap: onTap,
      hoverColor: const Color.fromARGB(161, 255, 194, 40),
      splashColor: AppTheme.favColor,
      highlightColor: const Color.fromARGB(44, 255, 238, 129),
      child: Expanded(
        child: CustomPaint(
          painter: _LeftDottedBorderPainter(),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: 'MadimiOne',
                    fontSize: 14,
                    color: AppTheme.darkOrange,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'MadimiOne',
                    fontSize: 38,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
  }
}

class _LeftDottedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.darkOrange
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    
    const dashWidth = 4;
    const dashSpace = 4;
    double startY = 0;
    
    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}