import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../adapter_platform/android_ios.dart';
import 'article.dart';

class DetailControlleur extends StatelessWidget{

  Article article;

  DetailControlleur({super.key,required this.article});

  @override
  Widget build(BuildContext context) {
  return AndroidIos().androidIosScaffold(
      titre: Text(article.title),
      corps: SingleChildScrollView(
        child:Column(
          children: [
            Padding(
                padding: EdgeInsets.all(10),
                child:Image.network(article.imgUrl),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(article.description,textAlign: TextAlign.justify),
            ),
            ElevatedButton(
                onPressed: ()async{
                  if( await canLaunchUrl(Uri.parse(article.urlLink))){
                    await launchUrl(Uri.parse(article.urlLink));
                  }
                },
            child: Text("voir l'intégralité de l'article")
            )
          ],
        ),
      )
  );
  }

}