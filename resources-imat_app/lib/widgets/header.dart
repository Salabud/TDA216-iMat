import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/widgets/header_buttons.dart';
import 'package:imat_app/widgets/step_progress_bar.dart';

class Header extends StatelessWidget {
  const Header({super.key,required this.currentStep});
  final int currentStep;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.orange,
      width: double.infinity,
      height: 100,
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
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width:20),
          Text("i",style:AppTheme.iStyle),
          Text("MAT",style:AppTheme.logoStyle),
        ],
    );
  }
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

