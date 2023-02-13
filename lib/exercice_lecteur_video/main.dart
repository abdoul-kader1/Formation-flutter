import 'package:flutter/material.dart';
import 'controlleurs/controleMain.dart';

class LecteurVideo extends StatefulWidget{

  String title= "Exercice Jouer de la vidéo";
  String img ="lib/image menu/lecteur_video.jpg";

  @override
  LecteurVideoState createState()=>LecteurVideoState();
}

class LecteurVideoState extends State<LecteurVideo>{
  @override
  Widget build(BuildContext context) {
    return ControleMain();
  }
}