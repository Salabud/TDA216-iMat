import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/pages/main_view.dart';
import 'package:imat_app/pages/payment_view.dart';

class StepProgressBar extends StatelessWidget {
  final int currentStep; // 0 = Logga in, 1 = Handla, 2 = Betala

  const StepProgressBar({required this.currentStep, super.key});

  @override
  Widget build(BuildContext context) {
    final steps = ['Logga in', 'Handla', 'Betala'];
    final views = [MainView(), MainView(), PaymentView()];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(steps.length * 2 - 1, (index) {
        if (index.isOdd) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Align(
              alignment: Alignment(0,-0.4),
              child: Icon(Icons.arrow_forward, color: (currentStep > index~/2) ? Colors.white : AppTheme.darkOrange)
            ),
          );
        }

        final stepIndex = index ~/ 2;
        return GetRightStage(
          index: stepIndex,
          currentStep: currentStep,
          label: steps[stepIndex].toString()
        );
      }),
    );
  }
}

class GetRightStage extends StatelessWidget {
  final int index;
  final int currentStep;
  final String label;
  const GetRightStage({super.key,required this.index,required this.currentStep,required this.label});
  
  @override
  Widget build(BuildContext context) {
    if (currentStep == 10){
      return CompletedStage(label: label);
    }
    if (index < currentStep){
      return PastStage(label: label);
    }
    if (index == currentStep){
      return CurrentStage(label: label);
    }
    return FutureStage(label: label);
  }
}

class PastStage extends StatelessWidget {
  const PastStage({super.key,required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Step circle
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
              color: AppTheme.orange,
            ),
            child: Center(
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ],
      );
  }
}

class CurrentStage extends StatelessWidget {
  const CurrentStage({super.key,required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Step circle
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
              color: AppTheme.orange,
            ),
            child: Center(
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: AppTheme.orange,
                  border: Border.all(color: Colors.white, width: 4),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ],
      );
  }
}

class FutureStage extends StatelessWidget {
  const FutureStage({super.key,required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Step circle
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.darkOrange,
            ),
            child: Center(
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: AppTheme.orange,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.normal,
              color: AppTheme.darkOrange,
            ),
          ),
        ],
      );
  }
}

class CompletedStage extends StatelessWidget {
  const CompletedStage({super.key,required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Step circle
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.orange,
              border: Border.all(color:Colors.white,width:3)
            ),
            child: Center(
              child: Icon(Icons.check_circle,color:Colors.white,size:22,)
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      );
  }
}