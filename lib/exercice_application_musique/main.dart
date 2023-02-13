import 'package:flutter/material.dart';
import 'controllers/mainController.dart';

class ApplicationMusique extends StatefulWidget{

  String title= "Exercice Application de musique";
  String img ="lib/image menu/lecteur_audio.jpg";

  @override
  ApplicationMusiqueState createState()=>ApplicationMusiqueState();
}

class ApplicationMusiqueState extends State<ApplicationMusique>{

   int index=0;

  @override
  Widget build(BuildContext context) {
   return MainController(indexPrincipale:index);
  }
}