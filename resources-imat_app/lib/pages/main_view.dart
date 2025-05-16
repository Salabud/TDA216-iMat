import 'package:flutter/material.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/widgets/browse_area.dart';
import 'package:imat_app/widgets/header.dart';
import 'package:imat_app/model/imat/product.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:imat_app/widgets/kategorier.dart';
import 'package:imat_app/widgets/kundvagn.dart';
import 'package:imat_app/widgets/product_card.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    var iMat = context.watch<ImatDataHandler>();
    var products = iMat.selectProducts;

    return Scaffold(
      body: Column(
        children: [
          Header(),
          Expanded(
            child: Row(children: [
              Kategorier(),
              BrowseArea(),
              Kundvagn()
            ],),
          )
        ]
      ),
    );

    /*
    return Scaffold(
      appBar: AppBar(title: Text('iMats produkter')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 4, //  4 kolumner
          crossAxisSpacing: 8, //  horisontellt mellanrum
          mainAxisSpacing: 8, //  vertikalt mellanrum
          childAspectRatio: 4 / 3, //  bredd/höjd-förhållande
          children:
              products.map((product) {
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: iMat.getImage(product)),
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${product.price.toStringAsFixed(2)}kr',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );*/
  }

  Card _productCard(ImatDataHandler iMat, Product product) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.paddingSmall),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: iMat.getImage(product)),
            Text(
              product.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: AppTheme.paddingSmall),
            Text(
              '${product.price.toStringAsFixed(2)}kr',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
