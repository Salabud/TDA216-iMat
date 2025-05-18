import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:imat_app/model/imat/product.dart';
import 'package:imat_app/model/imat/shopping_cart.dart';
import 'package:imat_app/model/imat/shopping_item.dart';
import 'package:imat_app/model/imat_data_handler.dart';

const double kundvagnWidth = 300;
const double kvittoWidth = 250;

class Kundvagn extends StatelessWidget {
  const Kundvagn({super.key});
  
  @override
  Widget build(BuildContext context) {
    var iMat = context.watch<ImatDataHandler>();

    return Container(
      color: Colors.lightBlueAccent,
      width: kundvagnWidth,
      height: double.infinity,
      child: Column(
        children: [
          KundvagnKvitto(iMat: iMat,),
          SizedBox(height: 25),
          KassaKnapp(),
          SizedBox(height:25)
        ],
      ),
    );
  }
}

class KassaKnapp extends StatelessWidget {
  const KassaKnapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kvittoWidth,
      height:75,
      color: const Color.fromARGB(255, 120, 167, 255),
      child: Text("kassaknapp")
    );
  }
}

class KundvagnKvitto extends StatelessWidget {
  final ImatDataHandler iMat;

  const KundvagnKvitto({
    super.key,
    required this.iMat
    });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: kvittoWidth,
        color: const Color.fromARGB(255, 223, 41, 255),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Kundvagn", style: TextStyle(fontSize: 25)),
            Expanded(child: KundvagnInnehall(iMat: iMat,)),
            KundvagnTotal()
          ],
        )
      ),
    );
  }
}

class KundvagnInnehall extends StatelessWidget {
  final ImatDataHandler iMat;

  const KundvagnInnehall({
    super.key,
    required this.iMat,
  });

  @override
  Widget build(BuildContext context) {
    ShoppingCart cart = iMat.getShoppingCart();
    
    return Expanded(
      child: Container(
        color: const Color.fromARGB(255, 107, 208, 255),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (ShoppingItem item in cart.items.reversed)
                KundvagnItem(item: item),
            ],
          ),
        ),
      ),
    );
  }
}

class KundvagnTotal extends StatelessWidget {
  const KundvagnTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      height:75,
      color: const Color.fromARGB(255, 117, 255, 250),
      child: Text("Total")
    );
  }
}

class KundvagnItem extends StatelessWidget {
  final ShoppingItem item;
  
  const KundvagnItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width:double.infinity,
      color: Colors.blue,
      child:Row(
        children: [
          Text("${item.product.name} "),
          Text("${item.amount}st "),
          Text("${item.total}:- ")
        ],
      )
    );
  }
}