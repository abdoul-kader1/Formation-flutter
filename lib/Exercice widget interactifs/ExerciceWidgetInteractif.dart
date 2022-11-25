import 'package:flutter/material.dart';

import '../main.dart';

class ExerciceWidgetInteractif extends StatefulWidget{
  String title= "Exercice Widget interactif";

  ExerciceWidgetInteractif({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExerciceWidgetInteractif();
  }

}

class _ExerciceWidgetInteractif extends State<ExerciceWidgetInteractif>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Formation flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder:(contextes){
                      return MyApp();
                    })
                );
              },
            )
        ),
        body: Center(
          child: Text("Bienvenu"),
        ),
      ),
    );
  }

}