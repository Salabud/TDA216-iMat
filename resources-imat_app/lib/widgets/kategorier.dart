import 'package:flutter/material.dart';
import 'package:imat_app/app_theme.dart';

class Kategorier extends StatelessWidget {
  const Kategorier({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width:150,
      color: Colors.grey,
      height:double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
      color: const Color.fromARGB(255, 184, 184, 184),

      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        
        child: GestureDetector(
          onTap: () {
           // TODO: Handle tap
          },
          child: Text("Favoriter"),
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
    return Container(
      color:Colors.blueGrey,
      child:Column(
        children: [
          Text("Kategorier - Rubrik"),
          const SizedBox(height: 16),
        ...kategorier.map(
          (category) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      // TODO: Handle tap
                    },
                    child: Text(
                      category,
                    ),
                  ),
                ),
              ],
            ),
            ),
        ),
        ],
      )
    );
  }
}