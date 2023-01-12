import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formation_flutter/adapter_platform/android_ios.dart';
import 'package:formation_flutter/exercice_liste_et_grille_marseille/ville.dart';

class DetailPage extends StatelessWidget{

   Ville ville;
  DetailPage({super.key, required Ville ville}):ville=ville;

  @override
  Widget build(BuildContext context) {
    final orientation=MediaQuery.of(context).orientation;
    return AndroidIos().androidIosScaffold(
        couleur:Colors.indigo,
        titre:Text(ville.nom),
        corps: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: (orientation==Orientation.portrait)?250:MediaQuery.of(context).size.width,
                  height: 200,
                  child:Image.asset(ville.img,fit: BoxFit.cover),
                ),
                Padding(
                    padding:EdgeInsets.all(20),
                  child:Text(ville.description,textAlign: TextAlign.justify),
                ),
              ],
            ),
          ),
        )
    );
  }

}