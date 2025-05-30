import 'package:flutter/material.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/widgets/header.dart';

class SideFlowHeader extends StatelessWidget {
  const SideFlowHeader({super.key,required this.title});
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return _header(context);
  }

    Widget _header(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: AppTheme.orange,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Logo(),
          title,
          _headerButton(context: context, title: "Tillbaka", onTap: (){Navigator.pop(context);}),
        ],
      ),
    );
  }

  Widget _headerButton({
  required BuildContext context,
  required String title,
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
                Padding(
                  padding:EdgeInsets.fromLTRB(10, 5, 18, 0),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios_new_rounded,color:AppTheme.darkOrange,size:30),
                      SizedBox(width:10),
                      Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'MadimiOne',
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
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