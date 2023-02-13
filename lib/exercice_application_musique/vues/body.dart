import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/audio_players.dart';
import '../modeles/artiste.dart';

class Bodys extends StatefulWidget{

  late double size;
  int?indexPrincipale;
  List<Artiste> lesArtistes;

  Bodys({super.key,required this.size,required this.lesArtistes,this.indexPrincipale});

  @override
  BodysState createState() {
    return BodysState();
  }

}
class BodysState extends State<Bodys>{

  bool selectionerCouleur=false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child:Container(
        margin: EdgeInsets.only(top: 35),
        height: widget.size,
        width: double.infinity,
        child: ListView.separated(
            itemCount:widget.lesArtistes[widget.indexPrincipale!].album[0].listeMusique.length,
            itemBuilder:(contexte,i){
              final listMusique=widget.lesArtistes[widget.indexPrincipale!].album[0].listeMusique[i];
              final artiste=widget.lesArtistes[widget.indexPrincipale!];
              final dureeMusique=widget.lesArtistes[widget.indexPrincipale!].album[0].listeMusique[i].duree;
              return Dismissible(
                direction: DismissDirection.endToStart,
                background:Container(
                  color: Colors.blueGrey.shade100,
                  child: Row(
                    children: [
                      Spacer(),
                      Padding(padding: EdgeInsets.only(right: 10),child:Icon(Icons.delete))
                    ],
                  ),
                ),
                key:Key(i.toString()),
                child:ListTile(
                  title:Text(listMusique.titre,style:GoogleFonts.signika()),
                  leading: Text("${i+1}"),
                  trailing: Text(dureeMusique,style: GoogleFonts.signika()),
                  onTap: (){
                    showModalBottomSheet(
                        isDismissible:false,
                        isScrollControlled:true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder:(contecte){
                          return SizedBox(
                            height:MediaQuery.of(context).size.height*0.6,
                            child:Container(
                                  width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(topRight:Radius.circular(40)),
                                    ),
                                    child:ControllerAudioPlayer(artistes: artiste,index: i,ctx:contecte,lecteurPourRecherche:false,)
                                ),
                          );
                        }
                    );
                  },
                ),
                onDismissed: (direction){

                },
              );
            },
            separatorBuilder:(contexte,i)=>Divider(),
        ),
      ),
    );
  }

}