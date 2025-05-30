import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/model/imat/order.dart';
import 'package:imat_app/model/imat/shopping_cart.dart';
import 'package:imat_app/model/imat/shopping_item.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:imat_app/pages/payment_view.dart';
import 'package:imat_app/widgets/header.dart';
import 'package:imat_app/widgets/kvitto.dart';
import 'package:imat_app/widgets/previous_button.dart';
import 'package:imat_app/widgets/side_flow_header.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HistoryView extends StatefulWidget {
  final Order? initialSelectedOrder;
  const HistoryView({super.key, this.initialSelectedOrder});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  Order? _selectedOrder;

  @override
  void initState() {
    super.initState();
    _selectedOrder = widget.initialSelectedOrder;
  }

  @override
  Widget build(BuildContext context) {
    var iMat = Provider.of<ImatDataHandler>(context, listen: false);

    var orders = iMat.orders;

    return Scaffold(
      backgroundColor: AppTheme.browseAreaBG,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SideFlowHeader(title:Text(
              "Mina Kvitton",
              style: TextStyle(
                fontFamily:'MadimiOne',
                color:Colors.white,
                fontSize: 40,
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 350,
                  child: Material(
                    color: Colors.white,
                    child: _ordersList(context, orders, _selectOrder),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Expanded(
                            child: _orderDetailsN(_selectedOrder),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _ordersList(BuildContext context, List<Order> orders, Function onTap) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(18, 30, 10, 5),
          child: Text(
            "KÖPHISTORIK",
            style:GoogleFonts.openSans(
              color: AppTheme.offBlack,
              fontWeight:FontWeight.w800,
              fontSize:22,
            )
          ),
        ),
        for (final order in orders.reversed) _orderInfo(order, onTap)],
    );
  }

  Widget _orderInfo(Order order, Function onTap) {
    return ListTile(
      onTap: () => onTap(order),
      title: Text('Kvitto ${order.orderNumber}, ${_formatDateTime(order.date)}',
        style: GoogleFonts.openSans(color:AppTheme.offBlack,fontWeight: FontWeight.w700)
      ),
      trailing: Icon(Icons.arrow_forward_ios, color:AppTheme.offBlack, size:14),
    );
  }

  _selectOrder(Order order) {
    setState(() {
      _selectedOrder = order;
    });
  }

  String _formatDateTime(DateTime dt) {
    final formatter = DateFormat('yyyy-MM-dd, HH:mm');
    return formatter.format(dt);
  }

  Widget _orderDetailsN(Order? order) {
    var iMat = context.watch<ImatDataHandler>();
    if (order != null) {
      return Column(
        children: [
          Kvitto(order:order,date:_formatDateTime(order.date)),
          SizedBox(height:25),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.green,
              padding: EdgeInsets.all(0),
              minimumSize: Size(308, 90),
              shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(15),
              )
            ),
            onPressed: () async {
              iMat.shoppingCartClear();
              for (ShoppingItem item in order.items) {
                iMat.shoppingCartAdd(item);
              }
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentView()),
              );
            }, 
            child: SizedBox(
              child: Row(
                children: [
                  Text(
                    "Köp Igen", 
                    style: TextStyle(fontFamily:'MadimiOne',color:Colors.white,fontSize: 30,fontWeight: FontWeight.w300)
                  ),
                  SizedBox(width:20),
                  Icon(Icons.shopping_cart, size: 35, color:AppTheme.darkGreen),
                ],
              ),
            ),
          ),
          SizedBox(height:25)
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Välj ett kvitto",
          style: GoogleFonts.openSans(color:const Color.fromARGB(156, 65, 65, 65),fontSize: 25)
        ),
        Text("från menyn till vänster",
          style: GoogleFonts.openSans(color:const Color.fromARGB(156, 65, 65, 65),fontSize: 25)
        ),
        Text("för att inspektera",
          style: GoogleFonts.openSans(color:const Color.fromARGB(156, 65, 65, 65),fontSize: 25)
        ),
        SizedBox(height:15),
        Icon(Icons.help,color:const Color.fromARGB(156, 65, 65, 65)),
        SizedBox(height:50),
        
      ],
    );
  }
}