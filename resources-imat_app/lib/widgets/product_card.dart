import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/model/imat/product.dart';
import 'package:imat_app/model/imat/shopping_item.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    var iMat = context.watch<ImatDataHandler>();
    var productAmount = 0.0;
    var inCart = false;
    for (ShoppingItem item in iMat.getShoppingCart().items){
      if (product == item.product){
        productAmount = item.amount;
        inCart = true;
        break;
      }
    }
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
                  children: [Row(
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
                        padding: const EdgeInsets.only(left: 12,top:12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "${product.price.toStringAsFixed(2)}:-",
                              style: TextStyle(fontSize: 40,fontWeight: FontWeight.w500,fontFamily: 'MadimiOne',color:AppTheme.offBlack),
                            ),
                            Text(
                              product.unit.substring(2),
                              style: const TextStyle(fontSize: 9),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  Row(
                    children: [
                      Text("Leverantör och Mer info")
                    ],
                  ),
                ]),
              ),
            ),
            
            // Buy button
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
                        fontSize: 20,
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
      width:50,
      height:50,
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
      width:50,
      height:50,
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
