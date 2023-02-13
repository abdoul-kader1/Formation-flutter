import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/controllerSearch.dart';
import '../modeles/artiste.dart';

class AppBare extends StatefulWidget{

  AppBare({super.key,this.lesArtistes,required this.sizeListeArtiste,required this.sizeLecteurAudio,required BuildContext leContexte,required this.indexPrincipale});

  int indexPrincipale;
  late double sizeListeArtiste;
  late double sizeLecteurAudio;
  List<Artiste>?lesArtistes;

  @override
  AppBareState createState() {
   return AppBareState();
  }

}
class AppBareState extends State<AppBare>{

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.lesArtistes![widget.indexPrincipale].album[0].coverAlbum),
                  fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.only(bottomLeft:Radius.circular(60))
          ),
          child: SafeArea(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed:(){
                          showModalBottomSheet(
                              isScrollControlled:true,
                              isDismissible:false,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder:(contecte){
                                return SizedBox(
                                  height:widget.sizeLecteurAudio,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight:Radius.circular(40))
                                    ),
                                    child:ControllerSearch(ctx:contecte),
                                  ),
                                );
                              }
                          );
                        },
                        icon:Icon(Icons.search,color: Colors.white)
                    )
                  ],
                ),
                Container(
                  width: 350,
                  height: 60,
                  //color: Colors.lightGreen,
                  margin: EdgeInsets.only(left:36),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          widget.lesArtistes![widget.indexPrincipale].nom,style:GoogleFonts.signika(fontSize:30,color: Colors.white)),
                      Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Container(
                            width: 70,
                            height: 50,
                            //color: Colors.green,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 22),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: CircleBorder()
                              ),
                              onPressed: () {},
                              child:Icon(Icons.play_circle,size: 70,),

                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }

}