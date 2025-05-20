import 'package:flutter/material.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/model/imat/product.dart';
import 'package:imat_app/model/imat/shopping_item.dart';
import 'package:imat_app/model/imat_data_handler.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final ImatDataHandler iMat;

  const ProductCard(this.product, this.iMat, {super.key});

  @override
  Widget build(BuildContext context) {
    var productAmount;
    for (ShoppingItem item in iMat.getShoppingCart().items){
      ;
      if (product == item.product){
        productAmount = item.amount;
      }
      else {
        productAmount = 0;
      }
    }
    return Card(
      elevation: 4,
      color: AppTheme.bottomCardGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 40,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: Offset(-2, -1), // changes position of shadow
                                    ),
                                  ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          width: 160,
                          height: 160,
                          child: Image(
                            image: iMat.getImage(product).image,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ),
                    
                    // Product info
                    Expanded(
                      child: Padding(
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
                              style: const TextStyle(fontSize: 20),
                            ),
                            Text(
                              product.unit.substring(2),
                              style: const TextStyle(fontSize: 9),
                            ),
                          ],
                        ),
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
            
            const Spacer(),
            
            // Buy button
            Padding(
              padding: EdgeInsets.all(10),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RemoveButton(
                      onPressed: () => iMat.shoppingCartUpdate(ShoppingItem(product),delta: -1),
                    ),
                    Text('${productAmount} st'),
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
