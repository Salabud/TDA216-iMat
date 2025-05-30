import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:imat_app/pages/history_view.dart';
import 'package:imat_app/pages/main_view.dart';
import 'package:imat_app/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PurchaseConfirmationView extends StatelessWidget {
  const PurchaseConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    var iMat = context.watch<ImatDataHandler>();
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 246, 246, 246),
        child: Column(
          children: [
            Header(currentStep: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle, color: AppTheme.green, size: 100),
                  Text(
                    'Betalning genomförd!',
                    style: GoogleFonts.openSans(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.offBlack,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Tack för ditt köp!\nDin order är nu slutförd och kommer levereras inom kort\n",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      fontSize: 20,
                      color: AppTheme.grey,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HistoryView(initialSelectedOrder: iMat.orders.last,)),
                        ),
                        child: Text('Se köphistorik',style:GoogleFonts.openSans(color:AppTheme.offBlack,fontWeight: FontWeight.w700,fontSize:30)),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        ),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainView()),
                        ),
                        child: Text('Till startsidan',style:GoogleFonts.openSans(color:Colors.white,fontWeight: FontWeight.w700,fontSize: 30)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.orange,
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}