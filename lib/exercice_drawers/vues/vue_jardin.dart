import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VueJardin extends StatefulWidget{

  String titre="La vue du jardin";

  @override
  VueJardinState createState()=>VueJardinState();

}
class VueJardinState extends State<VueJardin>{

  int image=1;

  @override
  Widget build(BuildContext context) {
   return Stack(
     fit: StackFit.expand,
     children: [
       Image.asset("lib/exercice_drawers/images/piscine $image.jpeg",fit: BoxFit.cover),
       Column(
         mainAxisAlignment:MainAxisAlignment.spaceBetween,
         children: [
           Container(
             margin: EdgeInsets.all(15),
             width: 180,
               height: 50,
               child: Center(
               child:Text(
                 "Acceuil",
                 style:TextStyle(
                     fontSize: 30
                 ),
               ),
               ),
               decoration: BoxDecoration(
                 color: Colors.white70,
                 borderRadius: BorderRadius.circular(20)
               ),
           ),
           Spacer(),
           Container(
             margin: EdgeInsets.all(15),
             width: 290,
               height: 100,
               child:Center(
                 child: Text("Une expertise unique en provenance au service de tout les jardins du monde rapprochons nous de la nature",textAlign: TextAlign.center),
               ),
                decoration: BoxDecoration(
                  color: Colors.white
                ),
           ),
           changerFondEcrand()
         ],
       )
     ],
   );
  }

  Container changerFondEcrand(){
    return Container(
      margin: EdgeInsets.all(15),
      width: 250,
      height: 50,
      color: Colors.lightGreen,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:nombreDeRow(5)
      ),
    );
  }

  List<Widget> nombreDeRow(int nombreDefois){
    List <Widget>lesRows =[];
    for(var i=0;i<nombreDefois;i++){
      lesRows.add(
          Row(
            children: [
              IconButton(
                  onPressed:(){
                    setState(() {
                      image=i+1;
                    });
                  },
                  icon:CircleAvatar(
                    child: Text("${i+1}"),
                  )
              )
            ],
          )
      );
    }
    return lesRows;
  }
}