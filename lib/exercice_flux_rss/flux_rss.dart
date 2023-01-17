import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formation_flutter/adapter_platform/android_ios.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/domain/rss_feed.dart';
import 'package:intl/intl.dart';

import 'article.dart';

class PageFluxRss extends StatefulWidget{

  PageFluxRss({super.key});

  String title= "Exercice flux RSS";
  String img ="lib/image menu/flux-rss-programmation.png";

  @override
  PageFluxRssState createState()=>PageFluxRssState();
}

class PageFluxRssState extends State<PageFluxRss>{

   List<Article>article=[];


  @override
  Widget build(BuildContext context) {
   return AndroidIos().androidIosScaffold(
       titre: Text("Flux RSS france bleu"),
       corps:Center(
         child: (article.length==0)?Text("nombre D'articles : ${article.length}")
             :GridView.builder(
             gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:1),
             itemCount: article.length,
             itemBuilder:(contexte,i){
               final unArticle=article[i];
               return Material(
                 child:Card(
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
               );
             },
         ),
       ),
     floatingActionButton: FloatingActionButton(onPressed:recuperFluxRss,child:Icon(Icons.remove_red_eye))
   );
  }
   //function pour récupérer le flux rss de fraternité matin option sport
   recuperFluxRss()async{
     String url="https://www.francebleu.fr/rss/sports.xml";
     final conversionUrl= Uri.parse(url);
     final client=http.Client();
     final  requeteClient= await client.get(conversionUrl);
     final fluxRss=RssFeed.parse(requeteClient.body);
     final items=fluxRss.items;
     if(items!=null){
       setState(() {
         article=items.map((item)=>Article(item:item)).toList();
       });
     }
   }
   //fonction pour formater une date
   formaterDate(DateTime laDate){
    DateFormat formatDeLaDate= DateFormat.yMMMEd();
    String changeFormat=formatDeLaDate.format(laDate);
    return changeFormat;
   }
}