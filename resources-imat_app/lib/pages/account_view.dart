import 'package:google_fonts/google_fonts.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/widgets/card_info.dart';
import 'package:imat_app/widgets/customer_details.dart';
import 'package:flutter/material.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/widgets/side_flow_header.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<CardInfoState> cardInfoKey = GlobalKey<CardInfoState>();

    return Scaffold(
      body: SafeArea(
        child: Container(
          color:AppTheme.browseAreaBG,
          child: Column(
            children: [
              SideFlowHeader(
                title:Text(
                  "Britta - Profilsida",
                  style: TextStyle(
                    fontFamily:'MadimiOne',
                    color:Colors.white,
                    fontSize: 40,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width:700,
                  decoration: BoxDecoration(
                    color:Colors.white,
                    boxShadow: [BoxShadow(
                      color: const Color.fromARGB(21, 0, 0, 0),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),]
                  ),
                  child: Column(
                    children: [
                      CardInfo(key: cardInfoKey,),
                      SizedBox(height:20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SaveCredentialsButton(infoKey: cardInfoKey),
                          SizedBox(width:30)
                        ],
                      ),
                      SizedBox(height:160)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SaveCredentialsButton extends StatelessWidget {
  const SaveCredentialsButton({super.key,required this.infoKey});
  final GlobalKey<CardInfoState> infoKey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.orange,
        padding: EdgeInsets.all(0),
        minimumSize: Size(200, 60),
      ),
      onPressed: () async {
        await infoKey.currentState?.saveCustomerData();
        await infoKey.currentState?.saveCreditCardData();
      }, 
      child: SizedBox(
        child: Text(
          "spara uppgifter", 
          style: GoogleFonts.openSans(color:Colors.white,fontSize: 20,fontWeight: FontWeight.w700)),
      ),
    );
  }
}