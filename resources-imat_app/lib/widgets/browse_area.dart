import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/model/imat/product.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:imat_app/widgets/product_card.dart';
import 'package:provider/provider.dart';

class BrowseArea extends StatelessWidget {
  final ScrollController scrollController;
  final Map<ProductCategory, GlobalKey> categoryKeys;
  
  const BrowseArea({
    super.key,
    required this.categoryKeys,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.browseAreaBG,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(70, 75, 97, 108),
              blurStyle: BlurStyle.inner,
              spreadRadius: 0,
              blurRadius:10,
            ),
            BoxShadow(
              color: AppTheme.browseAreaBG,
              spreadRadius: -2,
              blurRadius: 10,
              blurStyle: BlurStyle.inner,
            ),
          ]
        ),
        height: double.infinity,
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            for (final category in ProductCategory.values) ...[
              SliverToBoxAdapter(
                key: categoryKeys[category],
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 0, 10),
                  child: Text(
                    category.swedishName,
                    style: GoogleFonts.openSans(fontSize: 30,color:AppTheme.offBlack,fontWeight:FontWeight.w700),
                  ),
                ),
              ),
              CategoryGrid(category: category),
              const SliverToBoxAdapter(child: SizedBox(height: 15)),
            ]
          ],
        ),
      ),
    );
  }
}

class CategoryGrid extends StatelessWidget {
  final ProductCategory category;

  const CategoryGrid({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    final iMat = context.watch<ImatDataHandler>();
    final products = iMat
    .findProductsByCategory(category)
    .where((product) => iMat.selectProducts.contains(product))
    .toList();

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) => ProductCard(products[index]),
          childCount: products.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 20,
          childAspectRatio: 1.05,
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
      color: AppTheme.browseAreaBG,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
            child: Text(category.toString(), style: TextStyle(fontSize: 30))
          ),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            primary: false,
            padding:EdgeInsets.all(10),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children:[
              for (Product product in iMat.findProductsByCategory(category))
              ProductCard(product)
            ],
          )
        ],
      )
    );
  }
}
