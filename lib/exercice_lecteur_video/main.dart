import 'package:flutter/material.dart';
import 'controlleurs/controleMain.dart';

class Main extends StatefulWidget{

  String title= "Exercice Jouer de la vidéo";
  String img ="lib/image menu/lecteur_video.jpg";

  @override
  MainState createState()=>MainState();
}

class MainState extends State<Main>{
  @override
  Widget build(BuildContext context) {
    return ControleMain();
  }
}