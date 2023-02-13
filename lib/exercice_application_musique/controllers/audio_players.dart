import 'dart:math';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import '../modeles/DonneePosition.dart';
import '../modeles/artiste.dart';
import '../modeles/musique.dart';
import 'controlePlayer.dart';

class ControllerAudioPlayer extends StatefulWidget{

   Artiste?artistes;
  int index;
  BuildContext ctx;
  List<Musique>?listeMusique;
  final bool?lecteurPourRecherche;
   ControllerAudioPlayer({super.key,this.artistes,this.lecteurPourRecherche,this.listeMusique,required this.index,required this.ctx});

  @override
  ControllerAudioPlayerState createState()=>ControllerAudioPlayerState();
}

class ControllerAudioPlayerState extends State<ControllerAudioPlayer>{

  late AudioPlayer audioPlayer;

  bool repeat=false;
  bool shuffle=false;

  Stream<DonneePosition>get DonneePositionState=>
      Rx.combineLatest3<Duration,Duration,Duration?,DonneePosition>(
        audioPlayer.positionStream,
        audioPlayer.bufferedPositionStream,
        audioPlayer.durationStream,
        (positionStream,bufferedPosition,duration) => DonneePosition(
            position: positionStream, bufferedPosition: bufferedPosition,duration:audioPlayer.duration!
        )
      );

  @override
  void initState() {
    initialisationMusique();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    finDeLecteurAudio();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              width: 180,
              height:150,
              decoration: BoxDecoration(
                  color: Colors.grey,
                borderRadius: BorderRadius.only(topRight:Radius.circular(50))
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15,left: 15),
              width: 150,
              height: 180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight:Radius.circular(60)),
                  image: DecorationImage(
                    image: AssetImage(widget.lecteurPourRecherche==false?widget.artistes!.album[0].coverAlbum:verifiePhotoMusique(widget.listeMusique![widget.index].idAlbum)),
                    fit: BoxFit.cover
                  )
              ),
            )
          ],
        ),
        Container(
          width: 250,
          height:50,
          color:Colors.redAccent,
          child:Column(
            children: [
              Text(widget.lecteurPourRecherche==false?widget.artistes!.album[0].listeMusique[widget.index].titre:widget.listeMusique![widget.index].titre,style: GoogleFonts.signika(fontSize: 20)),
              Text(widget.lecteurPourRecherche==false? widget.artistes!.nom:verifieNomArtiste(widget.listeMusique![widget.index].idAlbum),style: GoogleFonts.signika(fontSize:17)),
            ],
          ),
        ),
       SizedBox(
         width:MediaQuery.of(context).size.width*0.9,
         child: StreamBuilder<DonneePosition>(
             stream: DonneePositionState,
             builder:(context,snapshot){
               final positionData=snapshot.data;
               return ProgressBar(
                 barHeight: 8,
                 progressBarColor: Colors.redAccent,
                 thumbColor: Colors.redAccent,
                 bufferedBarColor: Colors.red.shade200,
                 baseBarColor: Colors.grey,
                 progress: positionData?.position??Duration.zero,
                 buffered: positionData?.bufferedPosition??Duration.zero,
                 total:positionData?.duration??Duration.zero,
                 onSeek: audioPlayer.seek,
               );
             }
         ),
       ),
        Container(
          color: Colors.redAccent,
          width: 340,
          height:50,
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                  onPressed:(){
                    setState(() {
                      repeat=!repeat;
                    });
                  },
                  icon:Icon(repeat==false?Icons.repeat:Icons.repeat_one,size:30)
              ),
              Row(
                children: [
                  IconButton(
                      onPressed:shuffle==true?musiqueAleatoire:musiquePrecedente,
                      icon:Icon(Icons.skip_previous,size:30)
                  ),
                  ControllePlayer(audioPlayer: audioPlayer,repeat: repeat,ctx:widget.ctx),
                  IconButton(
                      onPressed:shuffle==true?musiqueAleatoire:musiqueSuivante,
                      icon:Icon(Icons.skip_next,size: 30)
                  )
                ],
              ),
              IconButton(
                  onPressed:(){
                    setState(() {
                      shuffle=!shuffle;
                    });
                  },
                  icon:Icon(shuffle==false?Icons.shuffle:Icons.shuffle_on_sharp,size:30)
              ),
            ],
          ),
        ),
      ],
    );
  }

  verifiePhotoMusique(int idArtiste){
    if(idArtiste==1){
      return "lib/exercice_application_musique/cover_musique/menace_santana.jpg";
    }else if(idArtiste==2){
      return "lib/exercice_application_musique/cover_musique/bosh.jpg";
    }
  }

  verifieNomArtiste(int idArtiste){
    if(idArtiste==1){
      return "Menace Santana";
    }else if(idArtiste==2){
      return "Bosh";
    }
  }

  initialisationMusique()async{
    audioPlayer=AudioPlayer();
    await audioPlayer.setAsset(widget.lecteurPourRecherche==false?widget.artistes!.album[0].listeMusique[widget.index].musique:widget.listeMusique![widget.index].musique);
    audioPlayer.play();
  }

  finDeLecteurAudio(){
    audioPlayer.dispose();
  }

  musiqueSuivante()async{
    int listeMusique=widget.lecteurPourRecherche==false?widget.artistes!.album[0].listeMusique.length-1:widget.listeMusique!.length-1;
    if(widget.index<listeMusique){
      setState((){
        audioPlayer.dispose();
        widget.index++;
        audioPlayer=AudioPlayer();
      });
      await audioPlayer.setAsset(widget.lecteurPourRecherche==false?widget.artistes!.album[0].listeMusique[widget.index].musique:widget.listeMusique![widget.index].musique);
      audioPlayer.play();
    }else{
      audioPlayer.dispose();
      Navigator.pop(widget.ctx);
    }
  }

  musiquePrecedente()async{
    if(widget.index>0){
      setState((){
        audioPlayer.dispose();
        widget.index--;
        audioPlayer=AudioPlayer();
      });
      await audioPlayer.setAsset(widget.lecteurPourRecherche==false?widget.artistes!.album[0].listeMusique[widget.index].musique:widget.listeMusique![widget.index].musique);
      audioPlayer.play();
    }else{
      audioPlayer.dispose();
      Navigator.pop(widget.ctx);
    }
  }

  musiqueAleatoire()async{
    int aleatoire=Random().nextInt(widget.lecteurPourRecherche==false?widget.artistes!.album[0].listeMusique.length:widget.listeMusique!.length);
    setState((){
      widget.index=aleatoire;
      audioPlayer.dispose();
      audioPlayer=AudioPlayer();
    });
    await audioPlayer.setAsset(widget.lecteurPourRecherche==false?widget.artistes!.album[0].listeMusique[widget.index].musique:widget.listeMusique![widget.index].musique);
    audioPlayer.play();
  }
}
