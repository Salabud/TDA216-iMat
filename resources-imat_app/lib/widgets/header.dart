import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/pages/main_view.dart';
import 'package:imat_app/widgets/header_buttons.dart';
import 'package:imat_app/widgets/step_progress_bar.dart';

class Header extends StatelessWidget {
  const Header({super.key,required this.currentStep});
  final int currentStep;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: AppTheme.orange,
      ),
      child: Row(
        children: [
          Logo(),
          Expanded(
            child: Center(
              child: Padding(
                padding:EdgeInsets.fromLTRB(100, 0, 0, 0),
                child: Transform.scale(
                  scale:1.1,
                  child: Progression(currentStep: currentStep,)
                ),
              ),
            ),
          ),
          HeaderButtons()
        ],
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.orange,
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainView()),
        ),
        hoverColor: const Color.fromARGB(161, 255, 194, 40),
        splashColor: AppTheme.favColor,
        highlightColor: const Color.fromARGB(44, 255, 238, 129),
        child: CustomPaint(
          painter: _RightDottedBorderPainter(),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width:15),
                Text("i",style:AppTheme.iStyle),
                Text("MAT",style:AppTheme.logoStyle),
                SizedBox(width:25)
              ],
          ),
        ),
      ),
    );
  }
}

class _RightDottedBorderPainter extends CustomPainter {
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
        Offset(size.width, startY),
        Offset(size.width, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class Progression extends StatelessWidget {
  const Progression({super.key,required this.currentStep});
  final int currentStep;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StepProgressBar(currentStep:currentStep),
    );
  }
}

class MinaKvittonKnapp extends StatelessWidget {
  const MinaKvittonKnapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 197, 89),
      child: Text("Mina Kvitton"),
    );
  }
}
class ProfilKnapp extends StatelessWidget {
  const ProfilKnapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 225, 155),
      child: Text("Inloggad som bettan"),
    );
  }
}

class HeaderButton extends StatelessWidget {
  const HeaderButton({
    super.key,
    required this.topText,
    required this.bottomText,
    required this.page,
  });

  final String topText;
  final String bottomText;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();

  }
}

