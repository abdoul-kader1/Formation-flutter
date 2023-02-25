import 'package:formation_flutter/exercice_meteo/modele/api_reponse.dart';
import '../modele/GroupedWeather.dart';

class DataConverter{

  List<Map<String,dynamic>>listMappable(List<dynamic>list){
    return list.map((e) => e as Map <String,dynamic>).toList();
  }

  String fromIcon(String string){
    return "http://openweathermap.org/img/wn/$string@2x.png";
  }

  List<GroupedWeather>byDay(APIResponse apiResponse){
    List<GroupedWeather>daily=[];
    apiResponse.list.forEach((forcast) {
      var date = DateTime.fromMillisecondsSinceEpoch(forcast.dt*1000);
      String day = dayFromInt(date.weekday);
      int hour = date.hour;
      int min = forcast.main.temp_min!.toInt();
      int max = forcast.main.temp_max!.toInt();
      String description = forcast.weather.first.description;
      String icon = forcast.weather.first.icon;
      final index= daily.indexWhere((d) =>d.day == day);
      if(index == -1){
        daily.add(GroupedWeather(min: min, max: max, description: description,icon: icon, day:day));
      }else{
        if(daily[index].min>min)daily[index].min=min;
        if(daily[index].max<max)daily[index].max=max;
        if(hour == 12 || hour == 13 || hour == 14){
          daily[index].description=description;
          daily[index].icon=icon;
        }
      }

    });
    return daily;
  }

  String dayFromInt(int day){
    switch(day){
      case 1:return "Lundi";
      case 2:return "Mardi";
      case 3:return "Mercredi";
      case 4:return "Jeudi";
      case 5:return "Vendredi";
      case 6:return "Samedi";
      default:return "Dimanche";
    }
  }
}