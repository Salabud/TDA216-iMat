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
      child: Text("Kategorier")
    );
  }
}

class FavoriterKnapp extends StatelessWidget {
  const FavoriterKnapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 184, 184, 184),
      child: Text("Favoriter")
    );
  }
}

class KategoriLista extends StatelessWidget {
  const KategoriLista({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.blueGrey,
      child:Column(
        children: [
          Text("Kategorier - Rubrik"),
        ],
      )
    );
  }
}