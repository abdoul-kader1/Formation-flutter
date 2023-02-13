import 'package:flutter/material.dart';
import '../modeles/artiste.dart';
import '../modeles/donneeArtiste.dart';
import '../vues/app_bar.dart';
import '../vues/body.dart';

class MainController extends StatefulWidget{

  int indexPrincipale;

  MainController({super.key,required this.indexPrincipale});

  @override
  MainControllerState createState()=>MainControllerState();
}

class MainControllerState extends State<MainController>{

  late double size;

  List<Artiste>lesArtistes=DonneeArtiste().donneeArtiste();

  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:PreferredSize(
        preferredSize:Size.fromHeight(size*0.4),
        child:AppBare(sizeListeArtiste:size*0.2,sizeLecteurAudio:size*0.9,leContexte: context,lesArtistes:lesArtistes,indexPrincipale: widget.indexPrincipale),

      ),
      body:Bodys(size: size*0.6,lesArtistes:lesArtistes,indexPrincipale:widget.indexPrincipale),
      bottomNavigationBar:BottomNavigationBar(
        currentIndex:widget.indexPrincipale,
        items:[
          BottomNavigationBarItem(icon:Icon(Icons.music_note_outlined),label: "Menace Santana"),
          BottomNavigationBarItem(icon:Icon(Icons.dangerous),label: "Bosh"),
        ],
        onTap: (index){
          setState(() {
            widget.indexPrincipale=index;
          });
        },
      )
    );
  }
}