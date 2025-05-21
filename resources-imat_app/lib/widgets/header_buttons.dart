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
          title: 'Kvittton',
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
      hoverColor: Color.fromARGB(104, 255, 186, 74),
      splashColor: Color.fromARGB(104, 255, 186, 74),
      highlightColor: Color.fromARGB(187, 255, 206, 108),
      child: Expanded(
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: AppTheme.darkOrange,
                width: 2,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
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
  );
}
  }