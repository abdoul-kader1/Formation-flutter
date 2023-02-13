import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../modeles/artiste.dart';

class ListArtisteVue extends StatefulWidget{

  int indexPrincipale;
  BuildContext ctx;
  final List<Artiste> lesArtistes;

  ListArtisteVue({super.key,required this.lesArtistes,required this.ctx,required this.indexPrincipale});

  @override
  ListArtisteVueState createState()=>ListArtisteVueState();
}

class ListArtisteVueState extends State<ListArtisteVue>{

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:EdgeInsets.only(top: 25),
          width: 360,
          height: 100,
          //color: Colors.blue,
          child: ListView.builder(
            itemCount:widget.lesArtistes.length,
              itemBuilder:(context,i){
                return ListTile(
                  title:Text(widget.lesArtistes[i].nom,style: GoogleFonts.signika()),
                  trailing: Text(widget.lesArtistes[i].genreMusique,style: GoogleFonts.signika()),
                  style:ListTileStyle.list,
                  onTap: (){
                    setState(() {
                      widget.indexPrincipale=i;
                      print(widget.indexPrincipale);
                      Navigator.pop(widget.ctx);
                    });

                  },
                );
              }
          ),
        )
      ],
    );
  }
}
