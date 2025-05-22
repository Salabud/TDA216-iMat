import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/model/imat/product.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:imat_app/widgets/browse_area.dart';
import 'package:provider/provider.dart';

class Kategorier extends StatelessWidget {
  final void Function(ProductCategory category) onCategorySelected;
  const Kategorier({required this.onCategorySelected,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:200,
      color: Colors.white,
      height:double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        FavoriterKnapp(),
        KategoriLista(function: onCategorySelected),
      ],)
    );
  }
}

class FavoriterKnapp extends StatelessWidget {
  const FavoriterKnapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        
        child: GestureDetector(
          onTap: () {
          },
          child: 
            Padding(
              padding:EdgeInsets.fromLTRB(18, 25, 0, 0),
              child: Text(
                "FAVORITER",
                style:GoogleFonts.openSans(
                  color: AppTheme.offBlack,
                  fontWeight:FontWeight.w800,
                  fontSize:22,
                )
              ),
            ),
          ),
        )
    );
  }
}

class KategoriLista extends StatelessWidget {
  KategoriLista({required this.function,super.key});
  final Function(ProductCategory category) function;

  final List<String> kategorier = const [
    "Mejeri",
    "Grönsaker",
    "Frukt",
    "Bröd",
    "Kött",
    "Snacks",
    "Kryddor",
    "Bakverk",
    "Frysvaror",
  ];

  final List<String> categories = 
    ProductCategory.values.map((cat) => cat.toString()).toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:EdgeInsets.fromLTRB(18, 25, 0, 0),
          child: Text(
            "KATEGORIER",
            style:GoogleFonts.openSans(
              color: AppTheme.offBlack,
              fontWeight:FontWeight.w800,
              fontSize:22,
            )
          ),
        ),
        const SizedBox(height: 16),
      ...ProductCategory.values.map(
        (category) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 20),
          child: Row(
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => function(category),
                  child: Text(
                    '• ${category.swedishName}',
                    style:GoogleFonts.openSans(
                      color: AppTheme.offBlack,
                      fontWeight:FontWeight.w700,
                      fontSize:10,
                    )
                  ),
                ),
              ),
            ],
          ),
          ),
      ),
      ],
    );
  }
}

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    super.key,
    required this.isToggled
  });

  final bool isToggled;

  @override
  Widget build(BuildContext context) {
    var iMat = context.watch<ImatDataHandler>();
    var icon =
        isToggled
            ? Icon(Icons.star, color: AppTheme.favColor)
            : Icon(Icons.star, color: AppTheme.unFavColor);

    return IconButton(
      onPressed: (){
        iMat.selectFavorites();
      },
      icon: icon);
  }
}

