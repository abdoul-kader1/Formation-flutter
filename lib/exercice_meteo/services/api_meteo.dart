import 'dart:convert';

import 'package:http/http.dart';
import '../modele/api_reponse.dart';
import '../modele/geo_code.dart';
import 'key_api_meteo.dart';

class ApiMeteo{

  String baseUrl="api.openweathermap.org/data/2.5/forecast";
  String lat="lat=";
  String lon="lon=";
  String appid="appid=";
  String lang="lang=fr";
  String units="units=metric";

  String prepareQuery(GeoPosition localisation){
    final longitute=localisation.lon;
    final latitude =localisation.lat;
    return "https://$baseUrl?$lat$latitude&$lon$longitute&$units&$lang&$appid$maKeyApi";
  }

  Future<APIResponse>callApi(GeoPosition localisation)async{
    final laRequete= prepareQuery(localisation);
    final uri=Uri.parse(laRequete);
    final call = await get(uri);
    Map<String,dynamic>map=json.decode(call.body);
    return APIResponse.fromjson(map);
  }
}