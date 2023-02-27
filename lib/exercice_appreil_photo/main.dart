import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class AppareilPhoto extends StatefulWidget{

  String title= "Exercice Appareil photo";
  String img ="lib/image menu/appraeil_photo.jpg";

  @override
  AppareilPhotoState createState() =>AppareilPhotoState();
}

class AppareilPhotoState extends State<AppareilPhoto>{

  ImagePicker imagePicker = ImagePicker();
  File?file;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title:Text("Appareil photo")),
     body: SingleChildScrollView(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
          Container(
               margin: EdgeInsets.only(top:20),
               width: 200,
               height: 200,
               decoration: BoxDecoration(
                   color: Colors.redAccent
               ),
            child: file!=null? Image.file(file!,fit: BoxFit.cover,): Text("prenez une photo"),
             ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 IconButton(
                     onPressed:(()=>useCamere(ImageSource.gallery)),
                     icon:Icon(Icons.photo),
                 ),
                 IconButton(
                     onPressed:(()=>useCamere(ImageSource.camera)),
                     icon:Icon(Icons.camera_alt)
                 )
               ],
           )

         ],
       ),
     ),
   );
  }

  //utiliser la gallerie ou la camera de l'utilisateur
  Future useCamere(ImageSource source)async{
    XFile? xfile = await imagePicker.pickImage(source: source);
    if(xfile != null){
      setState((){
        file = File(xfile.path);
      });

    }
  }

}