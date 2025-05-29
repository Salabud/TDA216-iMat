import 'package:flutter/material.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/pages/payment_view.dart';
import 'package:imat_app/widgets/browse_area.dart';
import 'package:imat_app/widgets/header.dart';
import 'package:imat_app/model/imat/product.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:imat_app/widgets/kategorier.dart';
import 'package:imat_app/widgets/kundvagn.dart';
import 'package:imat_app/widgets/product_card.dart';
import 'package:provider/provider.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final ScrollController _scrollController = ScrollController();

  final Map<ProductCategory, GlobalKey> _categoryKeys = {
    for (var category in ProductCategory.values) category: GlobalKey(),
  };
  
  bool _showOnlyFavorites = false;

  void _onFavoriteToggle(bool showOnlyFavs) {
    setState(() {
      _showOnlyFavorites = showOnlyFavs;
    });
  }

  void scrollToCategory(ProductCategory category) {
    final key = _categoryKeys[category];
    if (key != null && key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: Duration(milliseconds: 0),
        curve: Curves.easeInOut,
        alignment: 0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Header(currentStep: 1),
        Expanded(
          child: Row(children: [
            Kategorier(
              onCategorySelected: scrollToCategory,
              onFavoriteToggle: _onFavoriteToggle,
              isFavoriteSelected: _showOnlyFavorites,
            ),
            BrowseArea(
              scrollController: _scrollController,
              categoryKeys: _categoryKeys,
              showOnlyFavorites: _showOnlyFavorites,
            ),
            Kundvagn(nextButtonLabel: "Kassa",nextButtonPage: PaymentView(),)
          ]),
        )
      ]),
    );
  }
}
