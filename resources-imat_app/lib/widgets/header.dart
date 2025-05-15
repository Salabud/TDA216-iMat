import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      width: double.infinity,
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Logo(),
          Progression(),
          HeaderButtons()
        ],
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
      child: Text("iMat"),
    );
  }
}

class Progression extends StatelessWidget {
  const Progression({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 206, 29),
      child: Text("progression bar"),
    );
  }
}

class HeaderButtons extends StatelessWidget {
  const HeaderButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
      child: Row(children: [
        MinaKvittonKnapp(),
        ProfilKnapp()
      ],)
    );
  }
}

class MinaKvittonKnapp extends StatelessWidget {
  const MinaKvittonKnapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 197, 89),
      child: Text("Mina Kvitton"),
    );
  }
}
class ProfilKnapp extends StatelessWidget {
  const ProfilKnapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 225, 155),
      child: Text("Inloggad som bettan"),
    );
  }
}

