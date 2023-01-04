import 'package:flutter/material.dart';
import 'package:formation_flutter/exercice_pop_up_et_navigation/question.dart';

import 'navigation.dart';


class PisteDeJeu extends StatefulWidget{
  const PisteDeJeu({super.key});
  @override
  PisteDeJeuState createState()=> PisteDeJeuState();
}

class PisteDeJeuState extends State<PisteDeJeu>{

  Color couleurPrincipale=Colors.deepOrange;
  List<Questions>liste=Questions.liste();
  int index=0;
  int score=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: couleurPrincipale,
        title:Text("Score : $score point${accords(score)}"),
      ),
      body:SingleChildScrollView(
        child:  Center(
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 23),
            elevation: 20,
            child: Container(
              width: 350,
              height: 650,
              color:Colors.deepOrange.shade50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Question numéros ${index<=9?liste.indexOf(liste[index])+1:10} / 10",style:TextStyle(color:couleurPrincipale)),
                  Text(liste[index].question,style:const TextStyle(fontWeight: FontWeight.bold),textAlign:TextAlign.center),
                  Image.asset(liste[index].img),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //btn vrai
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:Colors.green
                          ),
                          onPressed:(){
                            scoreDuJeu(true);
                          },
                          child:const Text("VRAI")
                      ),
                      //btn faux
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:Colors.red
                          ),
                          onPressed:(){
                            scoreDuJeu(false);
                          },
                          child:const Text("FAUX")
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
//Méthode du score
  void scoreDuJeu(bool reponse){
    String image="";
    if(reponse==liste[index].reponse){
      image="lib/exercice_pop_up_et_navigation/assets_quizz/vrai.jpg";
      setState(() {
        score++;
      });
      dialogue(reponse==liste[index].reponse,image);
    }else{
      image="lib/exercice_pop_up_et_navigation/assets_quizz/faux.jpg";
      dialogue(reponse==liste[index].reponse,image);
    }
  }
//methode simple dialogue
  Future<void>dialogue(bool reponse,String img)async{
    return await showDialog(
        barrierDismissible: false,
        context: context,
        builder:(ctx){
          return SimpleDialog(
            contentPadding: const EdgeInsets.all(10),
            title: Text((reponse==true)?"C'est gagné":"Raté!"),
            children: [
              Image.asset(img),
              const SizedBox(height: 30),
              Text(liste[index].explication,textAlign: TextAlign.center),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed:(){
                    setState(() {
                      if(index<9){
                        index++;
                        Navigator.pop(context);
                      }else{
                        Navigator.pop(context);
                        alerte();
                      }
                    });

                  },
                  child:const Text("Passer a la question suivante")
              )
            ],
          );
        }
    );
  }
//methode alerte
  Future<void>alerte()async{
    return await showDialog(
        context: context,
        barrierDismissible: false,
        builder:(ctx){
          return AlertDialog(
            title: const Text("C'est fini!"),
            content: Text('votre score est de $score point${accords(score)}'),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: couleurPrincipale
                ),
                  onPressed:(){
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder:(ctxx){
                          return const PopUpEtNavigation();
                        })
                    );
                  },
                  child:const Text("Ok")
              )
            ],
          );
        }
    );
  }
//Fonction pour les accords
  String accords(int nombre){
    return(nombre>=2)?"s":"";
  }
}