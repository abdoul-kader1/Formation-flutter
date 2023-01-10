import 'package:flutter/material.dart';
import 'Exercice Basique/ExerciceBasique.dart';
import 'Exercice widget interactifs/ExerciceWidgetInteractif.dart';
import 'adapter_platform/android_ios.dart';
import 'exercice_pop_up_et_navigation/navigation.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return AndroidIos().materialCupertinoApp(
        home:const MyHomePage(title: "les exercices")
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
  List exercices=[
    const BasicPage(title: "Exercie widget Basique"),ExerciceWidgetInteractif(), const PopUpEtNavigation()
  ];

  @override
  Widget build(BuildContext context) {
    return AndroidIos().androidIosScaffold(
        titre:Text(widget.title),
        corps: ListView.builder(
          itemCount: exercices.length,
          itemBuilder: (contexte,i){
            return Material(
              child:ListTile(
                title: Text("${exercices[i].title}"),
                leading: Text("${i+1}"),
                trailing: const CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage("lib/logo flutter.png")
                ),
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx){
                        return exercices[i] ;
                      })
                  );
                },
              ) ,
            )
              ;
          },
        )
    );
  }
}

