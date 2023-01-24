import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formation_flutter/adapter_platform/android_ios.dart';
import '../modeles/video.dart';
import 'package:video_player/video_player.dart';

class PlayerControlleur extends StatefulWidget{

  Video video;

  PlayerControlleur({super.key,required this.video});

  @override
  PlayerControlleurState createState()=>PlayerControlleurState();
}

class PlayerControlleurState extends State<PlayerControlleur>{

  late VideoPlayerController _videoPlayerController;
  late Video _video;

  bool canMountVideoPlayer()=>_videoPlayerController.value.isInitialized;
  bool isPlaying()=>_videoPlayerController.value.isPlaying;

  @override
  void initState() {
    super.initState();
    _video=widget.video;
    configurationPlayer();
  }

  @override
  void dispose() {
    delatePlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return AndroidIos().androidIosScaffold(
       titre: Text(widget.video.titre),
       corps:Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: [
         canMountVideoPlayer()?AspectRatio(
           aspectRatio: _videoPlayerController.value.aspectRatio,
           child:VideoPlayer(_videoPlayerController),
         ):Container(child: Text("nooooooooo"),),
         Container(
           width: 200,
           height:50,
           color: Theme.of(context).colorScheme.secondary,
           child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 IconButton(onPressed:null, icon:Icon(Icons.skip_previous)),
                 IconButton(onPressed:null, icon:isPlaying()?Icon(Icons.pause_circle):Icon(Icons.play_circle)),
                 IconButton(onPressed:null, icon:Icon(Icons.skip_next)),
               ],
             ),
           ),
       ],
   )
   );
  }

  configurationPlayer(){
    _videoPlayerController=VideoPlayerController.network(_video.video);
    _videoPlayerController.initialize().then((value) =>miseAjour());
    _videoPlayerController.setLooping(true);
    _videoPlayerController.addListener(()=>miseAjour());
    _videoPlayerController.play();
  }

  delatePlayer(){
    _videoPlayerController.dispose();
  }

  miseAjour(){
    setState(() {
      _videoPlayerController.value.isPlaying?_videoPlayerController.play():_videoPlayerController.pause();
    });
  }

}