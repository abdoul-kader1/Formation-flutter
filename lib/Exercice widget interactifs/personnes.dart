import 'package:flutter/cupertino.dart';

class Personnes{
  String nom;
  String prenom;
  String secret;
  int age;
  double taille;
  String Function(bool b) genre;
  List<Widget>Function(Map i) hobbiee;
 String Function(Map i,int j) langagePreferer;
  Personnes({
    required this.nom,
    required this.prenom,
    required this.secret,
    required this.age,
    required this.taille,
    required this.genre,
    required this.hobbiee,
    required this.langagePreferer,
  });
}