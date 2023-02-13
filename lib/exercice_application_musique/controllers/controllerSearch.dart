import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../modeles/donneeArtiste.dart';
import '../modeles/maShared.dart';
import '../modeles/musique.dart';
import 'audio_players.dart';

class ControllerSearch extends StatefulWidget{

  BuildContext ctx;

  ControllerSearch({super.key,required this.ctx});

  @override
  ControllerSearchState createState()=> ControllerSearchState();
}

class ControllerSearchState extends State<ControllerSearch>{

  late TextEditingController laRecherche;
  List<Musique>faireRecherche=[];
  List lesAnciennesRecherche=[];
  @override
  void initState() {
    super.initState();
    laRecherche=TextEditingController();
    getSharedPref();
  }

  @override
  void dispose() {
    laRecherche.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical:20),
          child:Text("recherche",style: GoogleFonts.signika(fontSize:25)),
        ),
        Row(
          children: [
            Expanded(
                child:Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.only(left: 10),
                  child:TextField(
                    controller: laRecherche,
                    onChanged: (value){
                      setState(() {
                        faireRecherche=DonneeArtiste().rechercheMusique(laRecherche.text);
                      });
                    },
                    decoration:InputDecoration(
                        border: OutlineInputBorder(),
                        hintText:'Taper quelque chose'
                    ),
                  ),
                ),
            ),
            Container(
              margin: EdgeInsets.only(right:10),
              child:IconButton(
                  onPressed: onPresse,
                  icon:Icon(Icons.send)
              ),
            )
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child:Text(laRecherche.text==""?"Ancienne recherche":"Nous avons trouver pour vous",style:GoogleFonts.signika(fontSize:15),),
        ),
        Expanded(child: laRecherche.text==""?ancienneRecherche():nouvelleRecherche())
      ],
    );
  }

  ancienneRecherche(){
    return ListView.separated(
      separatorBuilder: (context,i) =>const Divider(),
      itemCount:lesAnciennesRecherche.length,
      itemBuilder: (contexte,i) {
        final value=lesAnciennesRecherche[i];
        return ListTile(
          title: Text(value),
          onTap:(){
            setState(() {
              laRecherche.text=value;
            });
          },
          onLongPress:(()=>remove(laRecherche.text)),
        );
      },
    );
  }

  nouvelleRecherche(){
    return ListView.separated(
      itemCount:faireRecherche.length,
      itemBuilder:(contexte,i){
        final titreMusique=faireRecherche[i].titre;
        final dureeMusique=faireRecherche[i].duree;
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
            title:Text(titreMusique,style:GoogleFonts.signika()),
            leading: Text("${i+1}"),
            trailing: Text(dureeMusique,style: GoogleFonts.signika()),
            onTap: (){
              Navigator.pop(widget.ctx);
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
                          child:ControllerAudioPlayer(listeMusique:faireRecherche,index: i,ctx:contecte,lecteurPourRecherche:true)
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
    );
  }

  getSharedPref(){
    MyShared().getDonnee().then((value) =>{
      setState((){
        lesAnciennesRecherche=value;
      })
    });
  }

  save(String string){
    MyShared().addItemToList(string).then((value) => getSharedPref());
  }

  remove(String string){
    MyShared().removeItemToList(string).then((value) =>{
      getSharedPref()
    });
  }

  onPresse(){
    FocusScope.of(context).requestFocus(FocusNode());
    if(laRecherche.text!="")save(laRecherche.text);
  }
}