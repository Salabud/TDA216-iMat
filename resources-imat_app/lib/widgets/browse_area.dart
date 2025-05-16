import 'package:flutter/material.dart';
import 'package:imat_app/model/imat/product.dart';

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
    return Container(
      color: Colors.lightGreen,
      child: Column(
        children: [
          Text(category.toString(), style: TextStyle(fontSize: 20),),
          Text("Lisa på produkter av den här kategorin...")
        ],
      )
    );
  }
}