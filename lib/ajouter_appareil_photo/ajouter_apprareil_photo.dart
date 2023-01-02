import 'package:flutter/material.dart';

import '../main.dart';

class AjouterAppareilPhoto extends StatefulWidget{
  final title="Exercice Ajouter l'appareil photo";
  AjouterAppareilPhoto({super.key});
  @override
  _AjouterAppareilPhoto_state createState()=>_AjouterAppareilPhoto_state();
}
class _AjouterAppareilPhoto_state extends State<AjouterAppareilPhoto>{

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title:Text(widget.title),
         leading: IconButton(
           icon: Icon(Icons.arrow_back),
           onPressed: (){
             Navigator.pushReplacement(
                 context,
                 MaterialPageRoute(builder:(contextes){
                   return MyApp();
                 })
             );
           },
         )
     ),
     body: SingleChildScrollView(
       child:Center(
         child: Column(
           children: [

           ],
         ),
       )

     ),
   );
  }
}