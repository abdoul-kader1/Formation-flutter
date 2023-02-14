import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mes_providers/le_compteur.dart';

class PageProvider extends StatelessWidget{

  PageProvider({super.key});

  String title= "Exercice provider";
  String img ="lib/image menu/provider.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("exercice provider",style: GoogleFonts.siemreap(fontSize:20))),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "le nombre de fois taper est :",
                style: GoogleFonts.siemreap(fontSize:20),
              ),
              Text(
                "${context.watch<LeCompteur>().index}",
                style: GoogleFonts.siemreap(fontSize:20),
              ),
             TextButton(
                 onPressed:(){
                   context.read<LeCompteur>().initialise();
                 },
                 child:Text("cliquez ici pour reinitialisé le compteur",style: GoogleFonts.siemreap(fontSize:17))
             )
            ],
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(()=>context.read<LeCompteur>().increment()),
        child: Icon(Icons.add),
      ),
    );
  }

}