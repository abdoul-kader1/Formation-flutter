import 'dart:async';

import 'package:flutter/material.dart';
import 'package:formation_flutter/exercice_pop_up_et_navigation/pisteDeJeu.dart';

import '../main.dart';

class PopUpEtNavigation extends StatefulWidget{
  final String title ="Pop up et navigation";
  const PopUpEtNavigation({super.key});
  @override
  PopUpEtNavigationState createState()=>PopUpEtNavigationState ();
}
class PopUpEtNavigationState  extends State<PopUpEtNavigation>{

  Color couleurPrincipale=Colors.deepOrange;
  bool like=false;
  int temps=0;
  bool afficherChargement=false;

  @override
  Widget build(BuildContext context) {
   return  Scaffold(
     appBar: AppBar(
       title: const Text("Quizz flutter"),
       backgroundColor:couleurPrincipale,
         leading: IconButton(
           icon: const Icon(Icons.arrow_back),
           onPressed: (){
             Navigator.pushReplacement(
                 context,
                 MaterialPageRoute(builder:(leContext){
                   return const MyApp();
                 })
             );
           },
         )
     ),
     body: SingleChildScrollView(
       child: Center(
         child:Column(
           children: [
             //premier élément de la page
             SizedBox(height: 100),
             Card(
               elevation: 20,
               child: Container(
                 padding: const EdgeInsets.symmetric(vertical:6),
                 width: 350,
                 height: 400,
                 color: Colors.deepOrange.shade200,
                 child: Column(
                   children: [
                     Container(
                         width: 330,
                         height: 300,
                         color: Colors.black,
                         child:Image.asset("lib/exercice_pop_up_et_navigation/assets_quizz/cover.jpg",fit: BoxFit.cover)
                     ),
                     const Spacer(),
                     ElevatedButton(
                         style: ElevatedButton.styleFrom(
                             backgroundColor:couleurPrincipale
                         ),
                         onPressed: afficherChargement==false?()async{
                           afficherChargement=true;
                           sncakBar(context: context);
                           compteur();
                           await Future.delayed(Duration(seconds:6));
                           Navigator.of(context).pushReplacement(
                               MaterialPageRoute(builder:(contextes){
                                 return PisteDeJeu();
                               })
                           );
                         }:null,
                         child:const Text("Commencer le quizz")
                     ),
                     (like==false)?const Icon(Icons.favorite_border_outlined,color: Colors.white):const Icon(Icons.favorite,color: Colors.red),
                     const Spacer(),
                   ],
                 ),
               ),
             ),
             //deuxieme élément de la page
             SizedBox(height:30),
            Text(afficherChargement==true?"chargement du jeu dans $temps...":"")
           ],
         ),
       ),
     ),
   );
  }
  
//Méthode snackbar
void sncakBar({required BuildContext context}){
    SnackBar snack=SnackBar(
        backgroundColor:couleurPrincipale,
        content:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Commencer en mettant un coeur"),
          ],
        ),
        action: SnackBarAction(
          label:"D'accord",
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              like=true;
            });
          },
        ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
}
//fonction pour compter le chargement du jeu
  Future<void> compteur()async{
    //dynamic leTemps;
    for(int i=1;i<=5;i++){
      await Future.delayed(Duration(seconds:1));
      setState(() {
        temps++;
      });
    }
  }
}
