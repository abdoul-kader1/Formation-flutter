import 'package:flutter/material.dart';
import 'package:formation_flutter/Exercice%20widget%20interactifs/personnes.dart';

class ExerciceWidgetInteractif extends StatefulWidget{
  ExerciceWidgetInteractif({super.key});
  String title= "Exercice Widget interactif";

  @override
  State<StatefulWidget> createState() {
    return _ExerciceWidgetInteractif();
  }

}

class _ExerciceWidgetInteractif extends State<ExerciceWidgetInteractif>{
  //Les attributs
  bool montreSecret=false;
  int groupValue=0;
  bool genres=true;
  Map<String,bool>hobbies={
    "Basket ":false,
    ",Salle de gyms ":false,
    ",Balade ":false,
    ",Pompe":false
  };
  Map<String,int>langageProgrammation={
    "HTML":1,
    "CSS":2,
    "PHP ":3,
    "JS":4,
    "Dart":5
  };
  Personnes personne=Personnes(
      nom: "Serifou",
      prenom: 'Kader',
      secret: "je me pignouf",
      age:21,
      taille: 180,
      genre:(genres){
        return(genres)?"Masculin":"Feminin";
      },
      hobbiee:(hobbies){
        List<Widget>myHobbies=[Text("Hobbies : ")];
        hobbies.forEach((key, value) {
          if(value!=false){
            Text t=Text(
                key
            );
            myHobbies.add(t);
          }
        });
        return myHobbies;
      },
      langagePreferer:(langageProgrammation,groupValue){
        String l="";
        langageProgrammation.forEach((key, value) {
          if(langageProgrammation[key]==groupValue){
            l=key;
          }
        });
        return l;
      }
  );
  //Les méthodes
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(widget.title),

        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              tableauDeBord(personne: personne),
              Divider(thickness: 2,color: Colors.deepPurple),
              Text("Modifier les infos",style: TextStyle(color: Colors.deepPurple,fontSize: 18,fontWeight: FontWeight.bold)),
              modifierinfo(),
              Divider(thickness: 2,color: Colors.deepPurple),
              Text("Mes hobbies",style: TextStyle(color: Colors.deepPurple,fontSize: 18,fontWeight: FontWeight.bold)),
              mesHobbies(),
              Divider(thickness: 2,color: Colors.deepPurple),
              Text("Langege preferer",style: TextStyle(color: Colors.deepPurple,fontSize: 18,fontWeight: FontWeight.bold)),
              langagePreferer()
            ],
          ),
        )
      );
  }

  //tableau de bord
  Card tableauDeBord({required Personnes personne}){
    return Card(
      elevation: 15,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade400,
          borderRadius: BorderRadius.circular(4)
        ),
        width: MediaQuery.of(context).size.width,
        height: 210,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("${personne.nom} ${personne.prenom}"),
            Text("${personne.age.toString()} ans"),
            Text("${personne.taille.round().toString()} cm"),
            Text(personne.genre(genres)),
            Row(
              mainAxisSize: MainAxisSize.min,
              children:personne.hobbiee(hobbies),
            ),
            Text("Lange de programmation preferer : ${personne.langagePreferer(langageProgrammation,groupValue)}"),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple
              ),
                onPressed:(){
                setState(() {
                  montreSecret=!montreSecret;
                });
                },
                child: Text(montreSecret==false?"Montre mon secret":"Cacher mon secret")
            ),
            Text(montreSecret==false?"":personne.secret)
          ],
        ),
      ),
    );
  }

  //Container modifier les info
  Container modifierinfo(){
    return Container(
      //color: Colors.deepPurple,
      height: 420,
      padding: EdgeInsets.all(20),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          mesTextfield(choix:1,infoPersonne:personne.nom,cacher:false,typeDechamps:TextInputType.text),
          mesTextfield(choix:2,infoPersonne:personne.prenom,cacher:false,typeDechamps:TextInputType.text),
          mesTextfield(choix:3,infoPersonne:personne.age.toString(),cacher:false,typeDechamps:TextInputType.number),
          mesTextfield(choix:4,infoPersonne:"Mon secret",cacher:true,typeDechamps:TextInputType.text),
          Row(
            children: [
              Text("Genre ${personne.genre(genres)}"),
              Spacer(),
              Switch(
                activeColor: Colors.deepPurple,
                  value:genres,
                  onChanged: (value){
                    setState((){
                      genres=value;
                    });
                  }
              )
            ],
          ),
          Row(
            children: [
              Text("Taille ${personne.taille.round()} cm"),
              Spacer(),
             Slider(
               activeColor: Colors.deepPurple,
               inactiveColor: Colors.deepPurple.shade200,
               min: 150,
               max: 200,
               value: personne.taille,
                 onChanged:(value){
                 setState((){
                   personne.taille=value;
                 });
                 }
             )
            ],
          ),
        ],
      ),
    );
  }

  //fonction pour les champs d'entrer
  TextField mesTextfield({required int choix, required String infoPersonne,required bool cacher,required TextInputType typeDechamps}){
    return  TextField(
      keyboardType:typeDechamps,
      obscureText: cacher,
      onChanged: (value){
        setState(() {
          miseAjour(choix,value);
        });
      },
      decoration: InputDecoration(
        hintText: infoPersonne,
        border: OutlineInputBorder(),
      ),
    );
  }
  //Mise a jour des champs
  miseAjour(int nombres,String valeur){
    if(nombres==1){
      personne.nom=valeur;
    }else if(nombres==2){
      personne.prenom=valeur;
    }else if(nombres==3){
      personne.age=int.parse(valeur);
    }else if(nombres==4){
      personne.secret=valeur;
    }
  }
  //container mes hobbies
  Padding mesHobbies(){
    List<Widget>line=[];
    hobbies.forEach((key, value) {
      Row r=Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(key),
          Spacer(),
          Checkbox(
            activeColor: Colors.deepPurple,
              value:value,
              onChanged:(change){
                setState(() {
                  hobbies[key]=change!;
                });
              })
        ],
      );
      line.add(r);
    });
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children:line,
      ),
    );
  }
  //container langage preferer
  Padding langagePreferer(){
    List<Widget>colonne=[];
    langageProgrammation.forEach((key, value) {
      Column c=Column(
        children: [
          Text(key),
          Radio(
            activeColor: Colors.deepPurple,
              value: value,
              groupValue:groupValue,
              onChanged:(val){
                setState((){
                  groupValue=val!;
                });
              }
          )
        ],
      );
      colonne.add(c);
    });
    return Padding(
        padding:EdgeInsets.all(20),
        child:Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children:colonne,
    ) ,
    );
  }
}