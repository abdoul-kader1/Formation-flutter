import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formation_flutter/adapter_platform/android_ios.dart';
import 'package:formation_flutter/exercice_liste_et_grille_marseille/ville.dart';

import 'detail_page.dart';

class ListeEtGrille extends StatefulWidget{

  String title ="Liste et grille marseille";
  String img="lib/image menu/widget grille et liste.png";

  ListeEtGrille({super.key});

  @override
   ListeEtGrilleState createState() =>ListeEtGrilleState();
}

class ListeEtGrilleState extends State<ListeEtGrille>{

  late bool vue;
  late List<Ville>ville;

  @override
  void initState() {
    vue=true;
    ville=Ville.listeDesVilles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orientation=MediaQuery.of(context).orientation;
    return AndroidIos().androidIosScaffold(
      couleur:Colors.indigo,
      titre: Text("Les lieux de marseille"),
      corps:(orientation==Orientation.portrait)?listeVIlle():gridVille()
    );
  }

  //fonction qui renvoie les villes sous forme de listes
  Widget listeVIlle(){
    return ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 10),
        itemBuilder:(contexte,i){
          final contenu=ville[i];
          return Material(
            child: Dismissible(
              direction: DismissDirection.endToStart,
              background: Container(
                padding: EdgeInsets.only(right: 20),
                color: Colors.indigo,
                child: Row(
                  children: [
                    Spacer(),
                    Icon(Icons.delete,color: Colors.white,)
                  ],
                ),
              ),
              key:Key(contenu.nom),
              onDismissed: (direction){
                setState(() {
                  ville.removeAt(i);
                });
              },
              child: ListTile(
                leading: Text("${i+1}"),
                title: Text(contenu.nom),
                trailing:Container(width: 80,height:80,child: Image.asset(contenu.img,fit: BoxFit.cover,)),
                onTap: (){
                  pagination(contenu);
                },
              ),
            ),
          );
        },
        separatorBuilder:(contexte,i)=>Divider(),
        itemCount:ville.length
    );
  }
  //fonction de la pagination
  pagination(Ville villes){
    return Navigator.push(context,
        MaterialPageRoute(builder: (builder){
          return  DetailPage(ville:villes);
        })
    );
  }
  //fonction qui renvoie les villes sous forme de grid
  Widget gridVille(){
    return GridView.builder(
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (contexte,i){
          final contenu=ville[i];
          return InkWell(
            child: Card(
              elevation: 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 180,
                    height: 150,
                    child:Image.asset(contenu.img,fit: BoxFit.cover),
                  ),
                  Text(contenu.nom)
                ],
              ),
            ),
            onTap: (){
              pagination(contenu);
            },
          );
        },
      itemCount: ville.length,
    );
  }
}
