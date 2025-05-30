import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/pages/payment_view.dart';
import 'package:imat_app/widgets/next_button.dart';
import 'package:provider/provider.dart';
import 'package:imat_app/model/imat/product.dart';
import 'package:imat_app/model/imat/shopping_cart.dart';
import 'package:imat_app/model/imat/shopping_item.dart';
import 'package:imat_app/model/imat_data_handler.dart';

const double kundvagnWidth = 300;
const double kvittoWidth = 250;

class Kundvagn extends StatelessWidget {
  const Kundvagn({
    super.key,
    required this.nextButtonPage,
    required this.nextButtonLabel,
    this.onBeforeNavigate,
  });

  final Widget nextButtonPage;
  final String nextButtonLabel;
  final Future<void> Function()? onBeforeNavigate;

  @override
  Widget build(BuildContext context) {
    var iMat = context.watch<ImatDataHandler>();

    return Container(
      color: Colors.white,
      width: kundvagnWidth,
      height: double.infinity,
      child: Column(
        children: [
          KundvagnKvitto(iMat: iMat,cart:iMat.getShoppingCart()),
          SizedBox(height: 25),
          NextButton(
            page: nextButtonPage,
            label: nextButtonLabel,
            onBeforeNavigate: onBeforeNavigate,
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}

class KassaKnapp extends StatelessWidget {
  const KassaKnapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder:
                  (context, animation, secondaryAnimation) =>
                      const PaymentView(),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                return child;
              },
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
        },
        child: Container(
          width: kvittoWidth,
          height: 90,
          decoration: BoxDecoration(
            color: AppTheme.green,
            borderRadius: BorderRadius.all((Radius.circular(15))),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255,64,64,64,).withValues(alpha: 0.5),
                spreadRadius: 0.2,
                blurRadius: 1,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Kassa  ",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'MadimiOne',
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppTheme.darkGreen,
                size: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KundvagnKvitto extends StatelessWidget {
  final ImatDataHandler iMat;
  final ShoppingCart cart;

  const KundvagnKvitto({super.key, required this.iMat, required this.cart});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: kvittoWidth,
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
                "Kundvagn",
                style: GoogleFonts.openSans(
                  fontSize: 25,
                  color: AppTheme.offBlack,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(child: KundvagnInnehall(cart:cart,iMat: iMat)),
            KundvagnTotal(),
          ],
        ),
      ),
    );
  }
}

class KundvagnInnehall extends StatelessWidget {
  final ImatDataHandler iMat;
  final ShoppingCart cart;

  const KundvagnInnehall({super.key, required this.iMat, required this.cart});

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (ShoppingItem item in cart.items.reversed)
              KundvagnItem(item: item, iMat: iMat),
          ],
        ),
      ),
    );
  }
}

class KundvagnTotal extends StatelessWidget {
  const KundvagnTotal({super.key});

  @override
  Widget build(BuildContext context) {
    var iMat = context.watch<ImatDataHandler>();
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
                (iMat.shoppingCartTotal() <= 0)
                    ? iMat.shoppingCartTotal().toString()
                    : '${iMat.shoppingCartTotal().toString()}:-',
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

class KundvagnItem extends StatelessWidget {
  final ShoppingItem item;
  final ImatDataHandler iMat;

  const KundvagnItem({super.key, required this.item, required this.iMat});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(5),
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
          SizedBox(
            width:90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    "${item.product.name}",
                    style: GoogleFonts.openSans(
                      fontSize: 15,
                      color: AppTheme.offBlack,
                    ),
                    overflow:TextOverflow.ellipsis,
                  ),
                ),
                AmountBar(item: item, iMat: iMat),
              ],
            ),
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
          IconButton(
            onPressed: () {
              iMat.shoppingCartRemove(item);
            },
            icon: Icon(Icons.delete_forever),
          ),
        ],
      ),
    );
  }
}

class AmountBar extends StatelessWidget {
  const AmountBar({super.key, required this.item, required this.iMat});

  final ShoppingItem item;
  final ImatDataHandler iMat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Container(
        width: 90,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: (item.amount > 0) ? Colors.white : Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RemoveButton(
                onPressed:
                    () => iMat.shoppingCartUpdate(
                      ShoppingItem(item.product),
                      delta: -1,
                    ),
              ),
              Text(
                '${item.amount} st',
                style: GoogleFonts.openSans(
                  color:
                      (item.amount > 0) ? AppTheme.offBlack : AppTheme.offBlack,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              BuyButton(
                onPressed:
                    () => iMat.shoppingCartAdd(ShoppingItem(item.product)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuyButton extends StatelessWidget {
  const BuyButton({required this.onPressed, super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(color: AppTheme.green, shape: BoxShape.circle),
      child: IconButton(
        constraints: BoxConstraints(),
        padding: EdgeInsets.zero,
        icon: Icon(Icons.add, size: 14),
        color: Colors.white,
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}

class RemoveButton extends StatelessWidget {
  const RemoveButton({required this.onPressed, super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: AppTheme.darkGrey,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        constraints: BoxConstraints(),
        padding: EdgeInsets.zero,
        icon: Icon(Icons.remove, size: 14),
        color: Colors.white,
        onPressed: () {
          onPressed();
        },
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
