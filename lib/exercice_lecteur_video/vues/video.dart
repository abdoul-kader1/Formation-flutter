import 'package:flutter/material.dart';
import '../controlleurs/playerController.dart';
import '../modeles/video.dart';

class VueVideo extends StatefulWidget{

  List<Video>lesVideo;

  VueVideo({required this.lesVideo});

  @override
  VueVideoState createState()=>VueVideoState();
}

class VueVideoState extends State<VueVideo>{


  @override
  Widget build(BuildContext context) {
   return GridView.builder(
     padding: EdgeInsets.all(10),
       gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent:MediaQuery.of(context).size.width,mainAxisExtent:MediaQuery.of(context).size.width/1.4),
       itemCount:widget.lesVideo.length,
       itemBuilder:(contexte,i){
         final contenu=widget.lesVideo[i];
         return InkWell(
           child:Material(
               child: Card(
                 child: Container(
                   height: MediaQuery.of(context).size.width/2,
                   color: Colors.blueGrey.shade100,
                   child: Column(

                     children: [
                       Padding(
                         padding: EdgeInsets.all(10),
                         child: Image.network(contenu.coverImg),
                       ),
                       Padding(
                         padding: EdgeInsets.all(10),
                         child: Text(
                           contenu.titre,textAlign: TextAlign.center,
                           style: TextStyle(
                               color: Theme.of(context).colorScheme.secondary
                           ),
                         ),
                       )
                     ],
                   ),
                 ),
               )
           ),
           onTap: (){
             Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder:(contexte){
                       return PlayerControlleur(video:contenu);
                     }
                 )
             );
           },
         );
       }
   );
  }
}