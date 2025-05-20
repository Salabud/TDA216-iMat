import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/widgets/step_progress_bar.dart';

class Header extends StatelessWidget {
  const Header({super.key,required this.currentStep});
  final int currentStep;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.orange,
      width: double.infinity,
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Logo(),
          Progression(currentStep: currentStep,),
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
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("i",style:AppTheme.iStyle),
          Text("MAT",style:AppTheme.logoStyle),
        ],
      ),
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

class HeaderButtons extends StatelessWidget {
  const HeaderButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
      child: Row(children: [
        MinaKvittonKnapp(),
        ProfilKnapp()
      ],)
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

