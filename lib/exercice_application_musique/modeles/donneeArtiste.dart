import 'album.dart';
import 'artiste.dart';
import 'musique.dart';

class DonneeArtiste{

  donneeArtiste(){
    return [
      Artiste(
          id: 1, nom:"Menace Santana", genreMusique:"Rap-Drill",
          album:[
            Album(id:1, idArtiste:1,titre:"Into The Dark", coverAlbum:"lib/exercice_application_musique/cover_musique/menace_santana.jpg",
                listeMusique:[
                  Musique(id: 1, idAlbum:1, titre:"1809", musique:"lib/exercice_application_musique/musique/menace santana/01-1809.mp3",duree: "01:54"),
                  Musique(id: 2, idAlbum:1, titre:"Il-Était-Une-Fois", musique:"lib/exercice_application_musique/musique/menace santana/02-Il-Était-Une-Fois.mp3",duree:"01:10"),
                  Musique(id: 3, idAlbum:1, titre:"FREDDY-KRUEGER", musique:"lib/exercice_application_musique/musique/menace santana/03-FREDDY-KRUEGER.mp3",duree:"02:37"),
                  Musique(id: 4, idAlbum:1, titre:"Le-Cauchemar-Continue", musique:"lib/exercice_application_musique/musique/menace santana/04-Le-Cauchemar-Continue.mp3",duree:"02:25"),
                  Musique(id: 5, idAlbum:1, titre:"45-Seconds", musique:"lib/exercice_application_musique/musique/menace santana/05-45-Seconds.mp3",duree:"00:45"),
                  Musique(id: 6, idAlbum:1, titre:"Belek-mS", musique:"lib/exercice_application_musique/musique/menace santana/06-Belek-mS.mp3",duree:"02:33"),
                  Musique(id: 7, idAlbum:1, titre:"Into The Dark", musique:"lib/exercice_application_musique/musique/menace santana/07-Into-The-Dark.mp3",duree:"02:42"),
                  Musique(id: 8, idAlbum:1, titre:"Halloween", musique:"lib/exercice_application_musique/musique/menace santana/08-Halloween.mp3",duree:"02:52"),
                  Musique(id: 9, idAlbum:1, titre:"MaDrug-_", musique:"lib/exercice_application_musique/musique/menace santana/09-MaDrug-_.mp3",duree:"04:08")
                ]
            )
          ]
      ),
      Artiste(
          id: 2, nom:"Bosh", genreMusique:"Rap-Trap",
          album:[
            Album(id:1, idArtiste:2,titre:"Algorithme", coverAlbum:"lib/exercice_application_musique/cover_musique/bosh.jpg",
                listeMusique:[
                  Musique(id: 1, idAlbum:2, titre:"Algorithme", musique:"lib/exercice_application_musique/musique/bosh/01-Intro-Algorithme.mp3",duree:"01:55"),
                  Musique(id: 2, idAlbum:2, titre:"Chap-chap", musique:"lib/exercice_application_musique/musique/bosh/02-Chap-chap.mp3",duree:"02:21"),
                  Musique(id: 3, idAlbum:2, titre:"Super-héros", musique:"lib/exercice_application_musique/musique/bosh/03-Super-héros.mp3",duree:"02:01"),
                  Musique(id: 4, idAlbum:2, titre:"Hum-Hum-feat.-Unknown-T", musique:"lib/exercice_application_musique/musique/bosh/04-Hum-Hum-feat.-Unknown-T.mp3",duree:"02:24"),
                  Musique(id: 5, idAlbum:2, titre:"Toleka", musique:"lib/exercice_application_musique/musique/bosh/05-Toleka.mp3",duree:"02:03"),
                  Musique(id: 6, idAlbum:2, titre:"Visonnaire", musique:"lib/exercice_application_musique/musique/bosh/06-Visonnaire.mp3",duree:"02:05"),
                  Musique(id: 7, idAlbum:2, titre:"09-Téléphone", musique:"lib/exercice_application_musique/musique/bosh/09-Téléphone.mp3",duree:"02:30"),
                  Musique(id: 8, idAlbum:2, titre:"Sheubonidas", musique:"lib/exercice_application_musique/musique/bosh/11-Sheubonidas.mp3",duree:"02:29"),
                  Musique(id: 9, idAlbum:2, titre:"Black", musique:"lib/exercice_application_musique/musique/bosh/12-Black.mp3",duree:"02:25"),
                  Musique(id: 10,idAlbum:2, titre:"Himalaya-feat.-Soolking", musique:"lib/exercice_application_musique/musique/bosh/14-Himalaya-feat.-Soolking.mp3",duree:"02:31"),
                  Musique(id: 11,idAlbum:2, titre:"Kiff-aussi", musique:"lib/exercice_application_musique/musique/bosh/16-Kiff-aussi.mp3",duree:"02:47"),
                  Musique(id: 12,idAlbum:2, titre:"Avalanche", musique:"lib/exercice_application_musique/musique/bosh/18-Avalanche.mp3",duree:"03:02"),
                  Musique(id: 13,idAlbum:2, titre:"Big-liasse", musique:"lib/exercice_application_musique/musique/bosh/19-Big-liasse.mp3",duree:"02:03"),
                  Musique(id: 14,idAlbum:2, titre:"Gangsta shit  Doser ", musique:"lib/exercice_application_musique/musique/bosh/Bosh - Gangsta shit  Doser (Clip officiel).mp3",duree:"04:00"),
                  Musique(id: 15,idAlbum:2, titre:"Mauvais djo", musique:"lib/exercice_application_musique/musique/bosh/Bosh - Mauvais djo (Clip officiel).mp3",duree:"02:46"),
                ]
            )
          ]
      )
    ];
  }

  rechercheMusique(String string){
    final lowerString=string.toLowerCase();
    List<Musique>resultat=[];
    List<Artiste>lesArtistes=donneeArtiste();
    for(var i=0;i<lesArtistes.length;i++){
      for(var l=0;l<lesArtistes[i].album[0].listeMusique.length;l++){
        final nomArtiste=lesArtistes[i].nom.toLowerCase();
        final titreMusique=lesArtistes[i].album[0].listeMusique[l].titre.toLowerCase();
        final laMusique=lesArtistes[i].album[0].listeMusique[l];
        if(nomArtiste.contains(lowerString) || titreMusique.contains(lowerString)){
          resultat.add(laMusique);
        }
      }
    }
    return resultat;
  }
}