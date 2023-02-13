import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ControllePlayer extends StatelessWidget{

  AudioPlayer audioPlayer;
  bool repeat;
  BuildContext ctx;
  ControllePlayer({super.key,required this.audioPlayer,required this.repeat,required this.ctx});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
        stream: audioPlayer.playerStateStream,
        builder:(contexte,snapshot){
          final laMusique=snapshot.data;
          final etatMusique=laMusique?.processingState;
          final jouerLaMusique=laMusique?.playing;
          if(!(jouerLaMusique??false)){
            return IconButton(
                onPressed:audioPlayer.play,
                icon:Icon(Icons.play_circle_outline)
            );
          }else if(etatMusique!=ProcessingState.completed){
            return IconButton(
                onPressed:audioPlayer.pause,
                icon:Icon(Icons.pause_circle_outline)
            );
          }else if(etatMusique==ProcessingState.completed){
            if(repeat==true){
              audioPlayer.seek(Duration(seconds: 0));
            }else{
              Navigator.pop(ctx);
            }
          }
          return Icon(Icons.play_arrow_rounded);
        }
    );
  }

}