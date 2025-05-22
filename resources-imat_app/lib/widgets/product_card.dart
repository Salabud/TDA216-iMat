import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/model/imat/product.dart';
import 'package:imat_app/model/imat/product_detail.dart';
import 'package:imat_app/model/imat/shopping_item.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard(this.product, {super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();

}

class _ProductCardState extends State<ProductCard> {
  bool showInfo = false;

  @override
  Widget build(BuildContext context) {
    var iMat = context.watch<ImatDataHandler>();
    var productAmount = 0.0;
    var inCart = false;
    var product = widget.product;
    for (ShoppingItem item in iMat.getShoppingCart().items){
      if (product == item.product){
        productAmount = item.amount;
        inCart = true;
        break;
      }
    }
    var details = iMat.getDetail(product);

    return Card(
      elevation: 2,
      color: AppTheme.bottomCardGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    (showInfo && details != null) ? ProductInfo(details:details) : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withValues(alpha: 0.5),
                                spreadRadius: 0.2,
                                blurRadius: 6,
                                offset: Offset(-2, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: 160,
                                  height: 160,
                                  child: Image(
                                    image: iMat.getImage(product).image,
                                    fit: BoxFit.cover,
                                    alignment: Alignment.center,
                                  ),
                                ),
                                FavoriteButton(p: product)
                              ]
                            ),
                          ),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top:12),
                          child: Container(
                            width:140,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: GoogleFonts.openSans(fontWeight: FontWeight.bold,color:AppTheme.offBlack,fontSize: 20),
                                  overflow: TextOverflow.fade,
                                ),
                                Text(
                                  "${product.price.toStringAsFixed(2)}:-",
                                  style: TextStyle(fontSize: 40,fontWeight: FontWeight.w500,fontFamily: 'MadimiOne',color:AppTheme.offBlack),
                                ),
                                Text(
                                  product.unit.substring(2),
                                  style: GoogleFonts.openSans(fontSize: 15,color:AppTheme.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${(details != null) ? details.brand : ""} | ${(details != null) ? details.origin : ""}',
                          style: GoogleFonts.openSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color:const Color.fromARGB(255, 161, 161, 161),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: showInfo ? AppTheme.darkOrange : AppTheme.orange,
                            padding: EdgeInsets.all(0),
                            minimumSize: Size(100, 40),
                          ),
                          onPressed: () {
                            setState(() {
                              showInfo = !showInfo;
                            });
                          }, 
                          child: SizedBox(
                            child: Text(
                              showInfo ? "mer info" : "mer info", 
                              style: GoogleFonts.openSans(color:Colors.white,fontSize: 15,fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            
            // Buy bar
            Padding(
              padding: EdgeInsets.all(10),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: inCart ? AppTheme.green : Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RemoveButton(
                      onPressed: () => iMat.shoppingCartUpdate(ShoppingItem(product),delta: -1),
                    ),
                    Text(
                      '${productAmount} st',
                      style: GoogleFonts.openSans(
                        color: inCart ? Colors.white : AppTheme.offBlack,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      )
                    ),
                    BuyButton(
                      onPressed: () => iMat.shoppingCartAdd(ShoppingItem(product)),
                    ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuyButton extends StatelessWidget {
  const BuyButton({required this.onPressed,super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width:60,
      height:60,
      decoration: BoxDecoration(
        color:AppTheme.green,
        shape: BoxShape.circle, 
      ),
      child: IconButton(
        icon: Icon(Icons.add),
        color:Colors.white,
        onPressed: (){
          onPressed();
        }
      ),
    );
  }
}

class RemoveButton extends StatelessWidget {
  const RemoveButton({required this.onPressed,super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width:60,
      height:60,
      decoration: BoxDecoration(
        color:AppTheme.darkGrey,
        shape: BoxShape.circle, 
      ),
      child: IconButton(
        icon: Icon(Icons.remove),
        color:Colors.white,
        onPressed: (){
          onPressed();
        }
      ),
    );
  }
}

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.p
  });

  final Product p;

  @override
  Widget build(BuildContext context) {
    var iMat = context.watch<ImatDataHandler>();
    var isFavorite = iMat.isFavorite(p);

    var icon =
        isFavorite
            ? Icon(Icons.star, color: Colors.white)
            : Icon(Icons.star, color: AppTheme.unFavColor);

    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: (isFavorite) ? AppTheme.favColor : Colors.white,
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(
            color: const Color.fromARGB(97, 95, 95, 95),
            blurRadius: 1,
            spreadRadius: 1,
            offset: Offset(0, 2)
          )]
        ),
        child: IconButton(
          iconSize: 22,
          constraints: const BoxConstraints(),
          padding: EdgeInsets.zero,
          onPressed: (){
            iMat.toggleFavorite(p);
          },
          icon: icon,
        ),
      ),
    );
  }
}

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key,required this.details});
  final ProductDetail details;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.fromLTRB(15,10,15,10),
      child: Container(
        width:300,
        height:150,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (details.description != null) ? Text('Beskrivning: ${details.description}',style:GoogleFonts.openSans(color:AppTheme.grey,fontWeight: FontWeight.w500)) : Text(""),
            Text("-----",style:GoogleFonts.openSans(color:AppTheme.grey,fontWeight: FontWeight.w700)),
            Text("Innehåll: ${details.contents}", style: GoogleFonts.openSans(color:AppTheme.offBlack,fontWeight: FontWeight.w600))
          ]
        )
      ),
    );
  }
}
