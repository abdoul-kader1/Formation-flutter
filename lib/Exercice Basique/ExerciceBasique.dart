import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class ExerciceBasique extends StatefulWidget{
  String title= "Exercice Basique";
  @override
  State<StatefulWidget> createState() {
    return _ExerciceBasique();
  }

}

class _ExerciceBasique extends State<ExerciceBasique>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
          ),
          title: Text(widget.title),
        ),
        body:SingleChildScrollView(
          child: Column(
            children: [ //Profile(Lecontexte: context),
               Profile1(),
              SizedBox(height:13),Divider(thickness:1),AproposDeMoi(),Divider(thickness: 1),
              SizedBox(height:8),Amis(),Divider(thickness: 1),
              Post(
                  imageUser:"lib/Exercice Basique/image/utilisateur1.jpg",
                  imagePost:"lib/Exercice Basique/image/post1.jpg",
                  nomUser: "Serifou",
                  temps: "Il y'a 12 heures",
                  descriptionPost:"Je vais vous partagé mon bout de code flutter",
                  likes: "12 likes",
                  comments: "7 commentaires"

              ),
              Post(
                  imageUser:"lib/Exercice Basique/image/utilisateur2.jpg",
                  imagePost:"lib/Exercice Basique/image/post2.jpg",
                  nomUser: "Ismael",
                  temps: "Il y'a 1 heures",
                  descriptionPost:"En avant pour devenir un pro flutter",
                  likes: "145 likes",
                  comments: "78 commentaires"

              ),
              Post(
                  imageUser:"lib/Exercice Basique/image/utilisateur3.jpg",
                  imagePost:"lib/Exercice Basique/image/post3.jpg",
                  nomUser: "Christ",
                  temps: "Il y'a 1 minutes",
                  descriptionPost:"Comment ne pas aimer l'informatique pfff",
                  likes: "14 likes",
                  comments: "9 commentaires"

              ),
              Post(
                  imageUser:"lib/Exercice Basique/image/utilisateur4.jpg",
                  imagePost:"lib/Exercice Basique/image/post4.jpg",
                  nomUser: "Cédric",
                  temps: "Il y'a 15 minutes",
                  descriptionPost:"j'ai évoluer dans mon apprentissage grace a kader",
                  likes: "1400 likes",
                  comments: "549 commentaires"

              )
            ],
          ),
        ),
      );
  }
  //Sexion du profile
  Widget Profile1(){
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        //photo de couverture
        Image.asset("lib/Exercice Basique/image/photo couverture.jpg"),
        Padding(
          padding:EdgeInsets.only(top:188),
          child: Column(
            children: [
              //photo de profile
             CircleAvatar(
               radius: 70,
               backgroundColor: Colors.white,
               child: CircleAvatar(
                   radius: 65,
                 backgroundImage:AssetImage("lib/Exercice Basique/image/photo profile.jpg"),
               ),
             ),
              SizedBox(height:1),
              //Description du profile
              Text(
                "Serifou Ahmed Abdoul-Kader",
                style:TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic
                ),
              ),
              SizedBox(height:8),
              Text(
                "Un jours l'informatique dominera le monde mais \n pas aujourd'hui c'est l'heure de la sieste",
                textAlign: TextAlign.center,
                style:TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic
                ),
              ),
              SizedBox(height:13),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed:(){},
                    child: Text("Modifier le profile"),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(left:60,right:60)
                    ),
                  ),
                  ElevatedButton(
                    onPressed:(){},
                    child: Icon(Icons.add_a_photo_outlined),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  //Sexion apropos de moi
  Column AproposDeMoi(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 18),
              width: 150,
              height: 20,
                child:Text("A propos de moi",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(onPressed:(){}, icon: Icon(Icons.home)),
            Text("Cocody-angré-mahou",style: TextStyle()),
          ],
        ),
        Row(
          children: [
            IconButton(onPressed:(){}, icon: Icon(Icons.work)),
            Text("Developpeur web",style: TextStyle()),
          ],
        ),
        Row(
          children: [
            IconButton(onPressed:(){}, icon: Icon(Icons.favorite)),
            Text("c'est compliqué"),
          ],
        )
      ],
    );
  }

  //Sexion amie
  Column Amis(){
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 18),
              width: 150,
              height: 20,
              child: Text("Amis",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
            ),
          ],
        ),
        SizedBox(height:8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width-275,
                  height: 158,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                          image: AssetImage("lib/Exercice Basique/image/rinnah.jpg"),
                        fit: BoxFit.cover
                      ),
                  ),
                ),
                SizedBox(height: 10),
                Text("Rinnah")
              ],
            ),
            Column(
              children: [
                Container(
                  width:MediaQuery.of(context).size.width-275,
                  height:158,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                        image: AssetImage("lib/Exercice Basique/image/mariam.jpg")
                    )
                  ),
                ),
                SizedBox(height: 10),
                Text("Mariam")
              ],
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width-275,
                  height:158,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                          image: AssetImage("lib/Exercice Basique/image/anne.jpg")
                      )
                  ),
                ),
                SizedBox(height: 10),
                Text("Anne")
              ],
            ),
          ],
        )
      ],
    );
  }

  //Sexion post
  Container Post({required String imageUser,required String imagePost,required String nomUser,required String temps,required String descriptionPost,required String likes,required String comments}){
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(left:10,right: 10),
      width:MediaQuery.of(context).size.width,
      height:388,
      color: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage(imageUser),
              ),
              SizedBox(width:8),
              Text(nomUser),
              Spacer(),
              Text(temps)
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height:230,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePost),
                fit: BoxFit.cover
              )
            ),
          ),
          Text(descriptionPost,textAlign: TextAlign.center,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.favorite),
              Text(likes),
              Icon(Icons.comment),
              Text(comments),
            ],
          )
        ],
      ),
    );
  }

}