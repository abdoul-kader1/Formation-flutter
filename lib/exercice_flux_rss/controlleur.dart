import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'detail_controller.dart';
import 'modele.dart';

class LeControlleur extends StatelessWidget{

  String url;
  LeControlleur(this.url);

  @override
  Widget build(BuildContext context) {
   return FutureBuilder(
       future:LeModele().recuperFluxRss(url),
       builder: (contexte,snapchot){
         final article=snapchot.data??[];
         return GridView.builder(
           gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:1),
           itemCount: article.length,
           itemBuilder:(contexte,i){
             final unArticle=article[i];
             return Material(
               child:InkWell(
                 child: Card(
                     elevation: 10,
                     child:Column(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Image.network(unArticle.imgUrl),
                         Text("Titre : ${unArticle.title}",textAlign: TextAlign.center),
                         Text("Publié le : ${formaterDate(unArticle.dateDePublication)}"),
                         Text("Description : ${unArticle.description}",textAlign: TextAlign.center,)
                       ],
                     )
                 ),
                 onTap: (){
                   Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder:(ctx){
                             return DetailControlleur(article: unArticle);
                           }
                       )
                   );
                 },
               ),
             );
           },
         );
       },
   );
  }

  //fonction pour formater une date
  formaterDate(DateTime laDate){
    DateFormat formatDeLaDate= DateFormat.yMMMEd();
    String changeFormat=formatDeLaDate.format(laDate);
    return changeFormat;
  }
}