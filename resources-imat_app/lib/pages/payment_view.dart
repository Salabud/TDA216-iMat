import 'package:flutter/material.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/pages/history_view.dart';
import 'package:imat_app/pages/main_view.dart';
import 'package:imat_app/pages/purchase_confirmation_view.dart';
import 'package:imat_app/widgets/browse_area.dart';
import 'package:imat_app/widgets/card_info.dart';
import 'package:imat_app/widgets/date_selector.dart';
import 'package:imat_app/widgets/header.dart';
import 'package:imat_app/model/imat/product.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:imat_app/widgets/kategorier.dart';
import 'package:imat_app/widgets/kundvagn.dart';
import 'package:imat_app/widgets/product_card.dart';
import 'package:provider/provider.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<CardInfoState> cardInfoKey = GlobalKey<CardInfoState>();
    var iMat = context.watch<ImatDataHandler>();

    return Scaffold(
      body: Column(
        children: [
          Header(currentStep: 2),
          Expanded(
            child: Row(
              children: [
                Expanded(flex: 1, child: Container(
                  color:Colors.white,
                  child: Column(
                    children: [
                      CardInfo(key: cardInfoKey),
                      PaymentInfoBottom(),
                    ],
                  ),
                )),

                Expanded(flex: 1, child: DateSelector()),
                Kundvagn(
                  nextButtonPage: PurchaseConfirmationView(),
                  nextButtonLabel: "Betala",
                  onBeforeNavigate: () async {
                    iMat.placeOrder();
                    await cardInfoKey.currentState?.saveCustomerData();
                    await cardInfoKey.currentState?.saveCreditCardData();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
