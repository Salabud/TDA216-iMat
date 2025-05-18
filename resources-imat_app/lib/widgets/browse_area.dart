import 'package:flutter/material.dart';
import 'package:imat_app/model/imat/product.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:imat_app/widgets/product_card.dart';
import 'package:provider/provider.dart';

class BrowseArea extends StatelessWidget {
  const BrowseArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding:EdgeInsets.all(20),
        child: Container(
          color: Colors.green,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                ...ProductCategory.values.map((category) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: CategorySection(
                      category: category,
                    )
                  );
                })
              ]
              //Should iterate through every item in ProductCategory and create a CategorySection
            ),
          )
        ),
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  final ProductCategory category;
  
  const CategorySection({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    var iMat = context.watch<ImatDataHandler>();
    
    return Container(
      color: Colors.lightGreen,
      child: Column(
        children: [
          Text(category.toString(), style: TextStyle(fontSize: 20),),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children:[
              for (Product product in iMat.findProductsByCategory(category))
              ProductCard(product, iMat),
            ],
          )
        ],
      )
    );
  }
}