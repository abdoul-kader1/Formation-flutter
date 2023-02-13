import 'musique.dart';

class Album{

  int id;
  String titre;
  String coverAlbum;
  int idArtiste;
  List <Musique>listeMusique;

  Album({required this.id,required this.idArtiste,required this.titre,required this.coverAlbum,required this.listeMusique});

}