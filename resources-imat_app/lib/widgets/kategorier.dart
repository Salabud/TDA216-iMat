import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:provider/provider.dart';

class Kategorier extends StatelessWidget {
  const Kategorier({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width:200,
      color: Colors.white,
      height:double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        FavoriterKnapp(),
        KategoriLista(),
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
            Text(
              "FAVORITER",
              style:GoogleFonts.openSans(
                color: AppTheme.offBlack,
                fontWeight:FontWeight.w800,
                fontSize:24,
              )
            ),
          ),
        )
    );
  }
}

class KategoriLista extends StatelessWidget {
  const KategoriLista({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "KATEGORIER",
          style:GoogleFonts.openSans(
            color: AppTheme.offBlack,
            fontWeight:FontWeight.w800,
            fontSize:24,
          )
        ),
        const SizedBox(height: 16),
      ...kategorier.map(
        (category) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 20),
          child: Row(
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    // TODO: Handle tap
                  },
                  child: Text(
                    '• ${category}',
                    style:GoogleFonts.openSans(
                      color: AppTheme.offBlack,
                      fontWeight:FontWeight.w700,
                      fontSize:20,
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