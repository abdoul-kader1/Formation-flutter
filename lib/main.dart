import 'package:flutter/material.dart';
import 'Exercice Basique/ExerciceBasique.dart';
import 'Exercice widget interactifs/ExerciceWidgetInteractif.dart';
import 'adapter_platform/android_ios.dart';
import 'exercice_application_musique/main.dart';
import 'exercice_drawers/main.dart';
import 'exercice_flux_rss/flux_rss.dart';
import 'exercice_lecteur_video/main.dart';
import 'exercice_liste_et_grille_marseille/liste_et_grille.dart';
import 'exercice_pop_up_et_navigation/navigation.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'exercice_provider/exercice_provider.dart';
import 'exercice_provider/mes_providers/le_compteur.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);

  runApp(
    MultiProvider(
        providers:[
          ChangeNotifierProvider(create:(_)=>LeCompteur())
        ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AndroidIos().materialCupertinoApp(
        home: const MyHomePage(title: "les exercices")
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
  List exercices = [
    BasicPage(title: "Exercie widget Basique"),
    ExerciceWidgetInteractif(),
    PopUpEtNavigation(),
    ListeEtGrille(),
    PageFluxRss(),
    LecteurVideo(),
    Drawers(),
    ApplicationMusique(),
    PageProvider()
  ];

  bool vue=true;

  @override
  Widget build(BuildContext context) {
    final orientation=MediaQuery.of(context).orientation;
    return AndroidIos().androidIosScaffold(
        trailing: Material(
          child: IconButton(
              onPressed:(){
                setState(() {
                  vue=!vue;
                });
              },
              icon:Icon((vue)?Icons.grid_4x4_sharp:Icons.list)),
        ),
        action:[
          IconButton(
              onPressed:(){
                setState(() {
                  vue=!vue;
                });
              },
              icon:Icon((vue)?Icons.grid_4x4_sharp:Icons.list))
        ],
        titre: Text(widget.title),
        corps: (vue)?listView():grilleView(orientations: orientation)
    );
  }

  // fonction qui retourne les exercices sous forme de liste
  Widget listView(){
    return ListView.separated(
        separatorBuilder:(contexte,i)=>const Divider(),
        itemCount:exercices.length,
        itemBuilder: (contexte, i) {
          final contenu=exercices[i];
          return Material(
            color: Colors.transparent,
            child: Dismissible(
              direction: DismissDirection.endToStart,
              background: Container(
                padding: EdgeInsets.only(right: 20),
                color: Colors.red,
                child:Row(
                  children: [
                    Spacer(),
                    Icon(Icons.delete),
                  ],
                ),
              ),
              key: Key(contenu.title),
              onDismissed: (direction){
                setState(() {
                  exercices.removeAt(i);
                });
              },
              child:ListTile(
                title: Text("${contenu.title}"),
                leading: Text("${i + 1}"),
                trailing: const CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage("lib/logo flutter.png")
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return contenu;
                  }));
                },
              ) ,
            )
            ,
          );
        }
    );
  }
  //fonction qui retourne les exercices sous forme de grille
  Widget grilleView({required Orientation orientations}){
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:orientations==Orientation.portrait?2:3),
        itemCount: exercices.length,
        itemBuilder: (contexte,i){
          final contenu=exercices[i];
          return Material(
            child: InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                      elevation: 20,
                      child:Container(
                        color: Colors.blueGrey.shade200,
                        padding: EdgeInsets.all(6),
                        width: 200,
                        height: 140,
                        child:Image.asset(contenu.img,fit: BoxFit.cover),
                      )
                  ),
                  Text("${contenu.title}",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center)
                ],
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return contenu;
                }));
              },
              onDoubleTap:(){
                setState(() {
                  exercices.removeAt(i);
                });
              },
            ),
          );
        }
    );
  }

}
