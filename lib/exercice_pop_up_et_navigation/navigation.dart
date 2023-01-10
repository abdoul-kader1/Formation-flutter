import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formation_flutter/adapter_platform/android_ios.dart';
import 'package:formation_flutter/exercice_pop_up_et_navigation/pisteDeJeu.dart';


class PopUpEtNavigation extends StatefulWidget{
  final String title ="Pop up et navigation";
  const PopUpEtNavigation({super.key});
  @override
  PopUpEtNavigationState createState()=>PopUpEtNavigationState ();
}
class PopUpEtNavigationState  extends State<PopUpEtNavigation>{

  Color couleurPrincipale=Colors.deepOrange;
  int temps=0;

  @override
  Widget build(BuildContext context) {
   return AndroidIos().androidIosScaffold(
       couleur:couleurPrincipale,
       titre: const Text("Quizz flutter"),
       corps: Center(
         child: Card(
           elevation: 20,
           child: Container(
             padding: const EdgeInsets.symmetric(vertical:6),
             width: 350,
             height: 365,
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
                 AndroidIos().boutton(
                     titre:"Commencer le quizz",
                     style: ElevatedButton.styleFrom(
                     backgroundColor:couleurPrincipale
                     ),
                     onPress:()async{
                       sncakBar(context: context);
                       message();
                       await Future.delayed(const Duration(seconds:6));
                       for(int i=1;i<=5;i++){
                         Navigator.pop(context);
                       }
                       Navigator.of(context).pushReplacement(
                           MaterialPageRoute(builder:(contextes){
                             return const PisteDeJeu();
                           })
                       );
                     }
                 ),
               ],
             ),
           ),
         ),
       )
   );
  }
  
//Méthode snackbar
void sncakBar({required BuildContext context}){
    SnackBar snack=SnackBar(
        backgroundColor:couleurPrincipale,
        content:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Merci de nous faire confiance"),
          ],
        ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
}
//fonction pour afficher un pop up
  Future<void>message()async{
    for(int i=1;i<=5;i++){
      await Future.delayed(const Duration(seconds:1));
      setState(() {
        temps=i;
      });
      showDialog(
        barrierColor:(i==1)?Colors.black54:Colors.transparent,
        context: context,
        builder:(ctx){
          return AndroidIos().alertDialogueMaterialCupertino(
              contentPadding:const EdgeInsets.all(30),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircularProgressIndicator(),
                  Text("Patienter dans $temps seconde${accords(i)}"),
                ],
              )
            ]
          );
        }
      );
    }
  }
//Fonction pour les accords
  String accords(int nombre){
    return(nombre>=2)?"s":"";
  }
}
