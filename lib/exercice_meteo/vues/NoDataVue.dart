import 'package:flutter/material.dart';

class NoDataDonnee extends StatelessWidget{
  NoDataDonnee({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Pas de donnée pour le lieu selectionner"),
    );
  }

}