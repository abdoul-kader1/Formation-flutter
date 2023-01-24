import 'package:flutter/material.dart';
import '../../adapter_platform/android_ios.dart';
import '../modeles/video.dart';
import '../vues/video.dart';

class ControleMain extends StatelessWidget{

   ControleMain({super.key});

  final List<String>lesTitres=["Nature","l'univers","La mere"];

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: lesTitres.length,
        child: AndroidIos().androidIosScaffold(
            tabar:TabBar(tabs:lesTitres.map((element)=>Tab(text: element)).toList()),
            titre:const Text("Lecteur video"),
            corps:TabBarView(children:lesTitres.map((e)=>VueVideo(lesVideo: Video.videosDefaut(e))).toList())
        ),
    );
  }


}