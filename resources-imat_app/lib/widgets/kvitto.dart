import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/model/imat/order.dart';
import 'package:imat_app/model/imat/shopping_cart.dart';
import 'package:imat_app/model/imat/shopping_item.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:provider/provider.dart';

class Kvitto extends StatelessWidget {
  final Order order;
  final String date;

  const Kvitto({super.key, required this.order,required this.date});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
              child: Text(
                "Kvitto ${date}",
                style: GoogleFonts.openSans(
                  fontSize: 22,
                  color: AppTheme.offBlack,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(child: KvittoInnehall(items: order.items)),
            KvittoTotal(total:order.getTotal()),
          ],
        ),
      ),
    );
  }
}

class KvittoInnehall extends StatelessWidget {
  final List<ShoppingItem> items;

  const KvittoInnehall({super.key, required this.items});

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (ShoppingItem item in items.reversed)
              KvittoItem(item: item),
          ],
        ),
      ),
    );
  }
}

class KvittoItem extends StatelessWidget {
  final ShoppingItem item;

  const KvittoItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    var iMat = context.watch<ImatDataHandler>();
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.fromLTRB(7, 5, 20, 5),
        child: Row(
          children: [
            Padding(
              padding:EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Stack(
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Image(
                        image: iMat.getImage(item.product).image,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name,
                  style: GoogleFonts.openSans(
                    fontSize: 15,
                    color: AppTheme.offBlack,
                  ),
                ),
                Text(
                  '${item.amount.toString()} ${item.product.unit.substring(3)}',
                  style: GoogleFonts.openSans(
                    fontSize: 15,
                    color: AppTheme.offBlack,
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              "${item.total}:-",
              style: GoogleFonts.openSans(
                color: AppTheme.offBlack,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KvittoTotal extends StatelessWidget {
  const KvittoTotal({super.key,required this.total});
  final double total;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _TopDottedBorderPainter(),
      child: Container(
        width: double.infinity,
        height: 75,
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 4, 15, 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  "Total:",
                  style: GoogleFonts.openSans(
                    color: AppTheme.offBlack,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Text(
                '${total}:-',
                style: TextStyle(
                  fontFamily: 'MadimiOne',
                  fontSize: 45,
                  color: AppTheme.offBlack,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopDottedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = const Color.fromARGB(255, 216, 216, 216)
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;

    const dashWidth = 4;
    const dashSpace = 5;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
