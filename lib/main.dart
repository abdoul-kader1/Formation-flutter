import 'package:flutter/material.dart';
import 'Exercice Basique/ExerciceBasique.dart';
import 'Exercice widget interactifs/ExerciceWidgetInteractif.dart';
import 'ajouter_appareil_photo/ajouter_apprareil_photo.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Formation flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Les exercices'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List Exercices=[
    BasicPage(title: "Exercie widget Basique"),ExerciceWidgetInteractif(),AjouterAppareilPhoto()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(widget.title),
      ),
      body:ListView.builder(
          itemCount: Exercices.length,
          itemBuilder:(contexte,i){
            return ListTile(
              title: Text("${Exercices[i].title}"),
              leading: Text("${i+1}"),
              trailing: CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage("lib/logo flutter.png"),
              ),
              onTap: (){
                Navigator.pushReplacement(
                  contexte,
                  MaterialPageRoute(builder:(contextes){
                      return  Exercices[i];
                  })
                );
              },
            );
          }
      ),
    );
  }
}
