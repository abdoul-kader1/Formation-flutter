import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formation_flutter/adapter_platform/android_ios.dart';
import 'package:formation_flutter/exercice_flux_rss/rss_type.dart';

import 'controlleur.dart';


class PageFluxRss extends StatefulWidget{

  PageFluxRss({super.key});

  String title= "Exercice flux RSS";
  String img ="lib/image menu/flux-rss-programmation.png";

  @override
  PageFluxRssState createState()=>PageFluxRssState();
}

class PageFluxRssState extends State<PageFluxRss>{

  bool article=false;
  List<RssType>mesFluxRss=[
    RssType(type: 'Sport',url: "https://www.francebleu.fr/rss/sports.xml"),
    RssType(type: 'Info',url: "https://www.francebleu.fr/rss/infos.xml"),
    RssType(type: 'Culture',url: "https://www.francebleu.fr/rss/culture.xml")
  ];

  @override
  Widget build(BuildContext context) {
   return DefaultTabController(
       length:mesFluxRss.length,
       child: AndroidIos().androidIosScaffold(
           tabar: TabBar(tabs:mesFluxRss.map((element) =>Tab(text: element.type)).toList()),
           titre: Text("Flux RSS france bleu"),
           corps:Center(
               child:TabBarView(
                 children:mesFluxRss.map((element) =>LeControlleur(element.url)).toList(),
               )
           ),
       ),
   );
  }

}