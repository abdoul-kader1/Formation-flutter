import 'package:flutter/material.dart';
import 'package:formation_flutter/exercice_meteo/modele/api_reponse.dart';
import 'package:formation_flutter/exercice_meteo/services/data_converter.dart';

import '../modele/GroupedWeather.dart';
import 'DailyTile.dart';
import 'currentWeather.dart';

class ForcastView extends StatelessWidget{

  APIResponse reponse;
  ForcastView({required this.reponse});

  @override
  Widget build(BuildContext context) {
    List<GroupedWeather> byDay = DataConverter().byDay(reponse);
    return Column(
      children: [
        CurrentWeather(forcast: reponse.list.first),
        Expanded(
          child: ListView.builder(
            itemBuilder:((contexte,i)=>DailyTile(day: byDay[i])),
            itemCount:byDay.length
          )
        )
      ],
    );
  }

}