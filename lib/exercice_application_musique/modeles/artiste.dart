import 'package:formation_flutter/exercice_application_musique/modeles/album.dart';

class Artiste{

  int id;
  String nom;
  String genreMusique;
  List<Album>album;

  Artiste({required this.id,required this.nom,required this.genreMusique,required this.album});

}