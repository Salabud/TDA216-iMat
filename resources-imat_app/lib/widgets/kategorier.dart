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

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    super.key,
    required this.isToggled
  });

  final bool isToggled;

  @override
  Widget build(BuildContext context) {
    var icon =
        isToggled
            ? Icon(Icons.star, color: Colors.white)
            : Icon(Icons.star, color: AppTheme.unFavColor);

    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: (isToggled) ? AppTheme.favColor : Colors.white,
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
          },
          icon: icon,
        ),
      ),
    );
  }
}

class FavoriterKnapp extends StatefulWidget {
  const FavoriterKnapp({super.key});

  @override
  State<FavoriterKnapp> createState() => _FavoriterKnappState();
}

class _FavoriterKnappState extends State<FavoriterKnapp> {
  bool _isFavoriteSelected = false;

  @override
  Widget build(BuildContext context) {
    var iMat = context.watch<ImatDataHandler>();

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isFavoriteSelected = !_isFavoriteSelected;
          });
          _isFavoriteSelected ? iMat.selectFavorites() : iMat.selectAllProducts();
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 25, 0, 0),
          child: Row(
            children: [
              Text(
                "FAVORITER",
                style: GoogleFonts.openSans(
                  color: AppTheme.offBlack,
                  fontWeight: FontWeight.w800,
                  fontSize: 22,
                ),
              ),
              const SizedBox(width: 8),
              FavoriteIcon(isToggled: _isFavoriteSelected),
            ],
          ),
        ),
      ),
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
        Container(
          height: 610,
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.transparent,Colors.white],
                stops: [0.0, 0.95, 1.0],
              ).createShader(bounds);
            },
            blendMode: BlendMode.dstOut,
            child: ListView(
              children: [
                ...ProductCategory.values.map(
                  (category) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    child: Material(
                      child: ListTile(
                        onTap: () => function(category),
                        tileColor:Colors.white,
                        title: Text(
                          '• ${category.swedishName}',
                          style: GoogleFonts.openSans(
                            color: AppTheme.offBlack,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )

      ],
    );
  }
}

