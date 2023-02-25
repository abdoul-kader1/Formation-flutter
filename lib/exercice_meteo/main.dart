import 'package:flutter/material.dart';
import 'package:formation_flutter/exercice_meteo/modele/api_reponse.dart';
import 'package:formation_flutter/exercice_meteo/services/api_meteo.dart';
import 'package:formation_flutter/exercice_meteo/services/dataService.dart';
import 'package:formation_flutter/exercice_meteo/services/location_service.dart';
import 'package:formation_flutter/exercice_meteo/vues/NoDataVue.dart';
import 'package:formation_flutter/exercice_meteo/vues/ajoutDesVilles.dart';
import 'package:formation_flutter/exercice_meteo/vues/forcastView.dart';
import 'package:formation_flutter/exercice_meteo/vues/maDrawers.dart';

import 'modele/geo_code.dart';

class PageMeteo extends StatefulWidget{

  PageMeteo({super.key});

  String title= "Exercice Meteo";
  String img ="lib/image menu/meteo.png";

  @override
  PageMeteoState createState()=>PageMeteoState();
}

class PageMeteoState extends State<PageMeteo>{

 GeoPosition userLocation=GeoPosition(ville: "", lat:0.0, lon:0.0);
 GeoPosition positionToCall=GeoPosition(ville: "", lat:0.0, lon:0.0);
 List<String>cities = [];
  APIResponse?apiResponse;

  @override
  void initState() {
    getUserPosition();
    miseAjourVille();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(positionToCall.ville),
      ),
      body: Column(
        children: [
          AjoutDesVilles(ajoutVille:ajoutVille),
          Expanded(
              child:apiResponse==null?NoDataDonnee():ForcastView(reponse:apiResponse!),
          )
        ],
      ),
      drawer: MaDrawer(myPosition:userLocation, cities:cities, onTap:onTap,supprimer:supprimerVille),
    );
  }

  //obtenir position GPS
  getUserPosition()async{
    final loc =await LocationService().getVille();
    if(loc!=null){
      setState(() {
        userLocation=loc;
        positionToCall = loc;
      });
      callApi();
    }
  }
  //callApi
  callApi()async{
    if(positionToCall == null) return;
    apiResponse = await ApiMeteo().callApi(positionToCall);
    setState(() {
    });
  }
  //supprimer clavier
  supprimerClavier(){
    FocusScope.of(context).requestFocus(FocusNode());
  }

  //nouvelle ville
  onTap(String string)async{
    Navigator.of(context).pop();
    supprimerClavier();
    if(string == userLocation.ville){
      positionToCall = userLocation;
      callApi();
    }else{
      positionToCall = (await LocationService().getVilleEnPosition(string))!;
      callApi();
    }
  }

  //ajouter
 ajoutVille(String string){
    DataService().addCitie(string).then((value) => miseAjourVille());
    supprimerClavier();
 }
 //supprimer
 supprimerVille(String string)async{
    DataService().supprCitie(string).then((value) =>miseAjourVille());
 }

 // mettre a jour les villes
 miseAjourVille()async{
    cities = await DataService().getCitie();
    setState(() {});
 }

}