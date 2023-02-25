import '../services/data_converter.dart';

class APIResponse{

String cod;
int message;
int cnt;
List <Forcast>list;

APIResponse({required this.cod,required this.message,required this.cnt,required this.list});
APIResponse.fromjson(Map<String,dynamic>map):
    cod=map["cod"],
    message=map["message"],
    cnt=map["cnt"],
    list = DataConverter().listMappable(map["list"]).map((e) =>Forcast.fromjson(e)).toList();
}

class Forcast{

int dt;
Main main;
List <Weather> weather;
Wind wind;
Clouds clouds;
double visibility;
String dt_txt;
Forcast({required this.dt,required this.main,required this.weather,required this.clouds,required this.wind,required this.visibility,required this.dt_txt});
Forcast.fromjson(Map<String,dynamic>map):
    dt = map["dt"],
    main = Main.fromjson(map["main"]),
    weather =DataConverter().listMappable(map["weather"]).map((e) => Weather.fromjson(e)).toList(),
    wind = Wind.formjson(map["wind"]),
    clouds = Clouds.fromjson(map["clouds"]),
    visibility = map["visibility"].toDouble(),
    dt_txt = map["dt_txt"];
}

class Main{

  double?temp;
  double?feels_like;
  double?temp_min;
  double?temp_max;
  double?pressure;
  double?sea_level;
  double?grnd_level;
  double?humidity;
  double?temp_kf;

  Main({this.temp,this.feels_like,this.temp_min,this.temp_max,this.pressure,this.sea_level,this.grnd_level,this.humidity,this.temp_kf});
  Main.fromjson(Map<String,dynamic>map):
      temp = map["temp"].toDouble(),
      feels_like = map["feels_like"].toDouble(),
      temp_min = map["temp_min"].toDouble(),
      temp_max = map["temp_max"].toDouble(),
      pressure = map["pressure"].toDouble(),
      sea_level = map["sea_level"].toDouble(),
      grnd_level = map["grnd_level"].toDouble(),
      humidity = map["humidity"].toDouble(),
      temp_kf = map["temp_kf"].toDouble();
}

class Weather{

int id;
String main;
String description;
String icon;

Weather({required this.id,required this.main,required this.description,required this.icon});
Weather.fromjson(Map<String,dynamic>map):
    id = map["id"],
    main = map["main"],
    description = map["description"],
    icon = map["icon"];
}

class Clouds{

  int all;

  Clouds({required this.all});
  Clouds.fromjson(Map<String,dynamic>map):
      all = map["all"];
}

class Wind{

  double speed;
  int deg;
  double gust;

  Wind({required this.speed,required this.deg,required this.gust});
  Wind.formjson(Map<String,dynamic>map):
      speed=map["speed"].toDouble(),
      deg=map["deg"],
      gust=map["gust"].toDouble();

}



