import 'package:flutter/material.dart';
import 'package:imat_app/app_theme.dart';

class PreviousButton extends StatelessWidget {
  const PreviousButton({
    super.key,
    required this.page,
    required this.label,
  });

  final Widget page;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => page,
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return child;
              },
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
        },
        borderRadius: BorderRadius.circular(15),
        hoverColor: const Color.fromARGB(255, 255, 95, 95).withOpacity(0.8),
        splashColor: AppTheme.darkRed.withOpacity(0.6),
        highlightColor: AppTheme.darkRed.withOpacity(0.4),
        child: Ink(
          width: 250,
          height: 90,
          decoration: BoxDecoration(
            color: AppTheme.red,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back_ios_rounded,
                color: AppTheme.darkRed,
                size: 35,
              ),
              Text(
                "  ${label}",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'MadimiOne',
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}