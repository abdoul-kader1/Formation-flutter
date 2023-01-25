import 'package:flutter/cupertino.dart';

class VueRealisation extends StatelessWidget{

  String titre="La vue des réalisation";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Column(
        children: [
          Padding(
            padding:EdgeInsets.all(5),
            child: Text("Nos réalisations"),
          ),
          leTitre("Nos piscines"),
          SizedBox(
            height: 430,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:EdgeInsets.all(10),
                    child:Image.asset("lib/exercice_drawers/images/piscine 1.jpeg"),
                  ),
                  Padding(
                    padding:EdgeInsets.all(10),
                    child:Image.asset("lib/exercice_drawers/images/piscine 2.jpeg"),
                  ),
                  Padding(
                    padding:EdgeInsets.all(10),
                    child:Image.asset("lib/exercice_drawers/images/piscine 3.jpeg"),
                  ),
                  Padding(
                    padding:EdgeInsets.all(10),
                    child:Image.asset("lib/exercice_drawers/images/piscine 4.jpeg"),
                  ),
                  Padding(
                    padding:EdgeInsets.all(10),
                    child:Image.asset("lib/exercice_drawers/images/piscine 5.jpeg"),
                  )
                ],
              ),
            ),
          ),
          leTitre("Nos jardins"),
          SizedBox(
            width: 360,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 160,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child:Image.asset("lib/exercice_drawers/images/piscine 1.jpeg",fit: BoxFit.cover),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                  Container(
                    width: 160,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child:Image.asset("lib/exercice_drawers/images/piscine 2.jpeg",fit: BoxFit.cover),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                  Container(
                    width: 160,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child:Image.asset("lib/exercice_drawers/images/piscine 3.jpeg",fit: BoxFit.cover),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                  Container(
                    width: 160,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child:Image.asset("lib/exercice_drawers/images/piscine 4.jpeg",fit: BoxFit.cover),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                  Container(
                    width: 160,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child:Image.asset("lib/exercice_drawers/images/piscine 5.jpeg",fit: BoxFit.cover),
                    ),
                    padding: EdgeInsets.all(10),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );

  }
  Row leTitre(String titre){
    return Row(
      children: [
        Padding(
            padding:EdgeInsets.only(left: 10,top: 10,bottom: 10),
            child:Text(titre),
        )
      ],
    );
  }
}