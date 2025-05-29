import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/model/imat/product.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:imat_app/widgets/product_card.dart';
import 'package:provider/provider.dart';

class BrowseArea extends StatefulWidget {
  final ScrollController scrollController;
  final Map<ProductCategory, GlobalKey> categoryKeys;
  final bool showOnlyFavorites;

  const BrowseArea({
    super.key,
    required this.categoryKeys,
    required this.scrollController,
    required this.showOnlyFavorites,
  });

  @override
  State<BrowseArea> createState() => _BrowseAreaState();
}

class _BrowseAreaState extends State<BrowseArea> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  List<Product> _filteredProductsInCategory(BuildContext context, ProductCategory category) {
  final iMat = context.read<ImatDataHandler>();
  final categoryProducts = iMat.findProductsByCategory(category);

  return categoryProducts.where((product) {
    final matchesSearch = _searchQuery.isEmpty ||
        product.name.toLowerCase().contains(_searchQuery.toLowerCase());

    final matchesFavorite = !widget.showOnlyFavorites || iMat.isFavorite(product);

    return matchesSearch && matchesFavorite;
  }).toList();
}



  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final iMat = context.watch<ImatDataHandler>();

    return Expanded(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppTheme.browseAreaBG,
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(70, 75, 97, 108),
                  blurStyle: BlurStyle.inner,
                  spreadRadius: 0,
                  blurRadius: 10,
                ),
                BoxShadow(
                  color: AppTheme.browseAreaBG,
                  spreadRadius: -2,
                  blurRadius: 10,
                  blurStyle: BlurStyle.inner,
                ),
              ],
            ),
            height: double.infinity,
            child: CustomScrollView(
              controller: widget.scrollController,
              slivers: [
                for (final category in ProductCategory.values)
                  if (_filteredProductsInCategory(context, category).isNotEmpty) ...[
                    SliverToBoxAdapter(
                      key: widget.categoryKeys[category],
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 20, 0, 10),
                        child: Text(
                          category.swedishName,
                          style: GoogleFonts.openSans(
                            fontSize: 30,
                            color: AppTheme.offBlack,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    CategoryGrid(
                      category: category,
                      products: _filteredProductsInCategory(context, category),
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 15)),
                  ]
              ],
            ),
          ),
          // Search Bar
          Positioned(
            top: 15,
            right: 30,
            child: Container(
              width: 220,
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(28, 65, 65, 65),
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
                border: Border.all(color: Colors.orangeAccent, width: 2),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.black54),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Sök...',
                        isDense: true,
                      ),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryGrid extends StatelessWidget {
  final ProductCategory category;
  final List<Product> products;

  const CategoryGrid({
    required this.category,
    required this.products,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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


