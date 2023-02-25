import 'package:flutter/services.dart';
import 'package:location/location.dart';
import '../modele/geo_code.dart';
import 'package:geocoding/geocoding.dart' as geocoding;


class LocationService{

  //obtenir la localisation d'un utilisateur
  Future<LocationData?>getPosition()async{
    try{
      Location location=Location();
      return location.getLocation();
    }on PlatformException catch(erreur){
      print("nous avons eu cette erreur ${erreur.message}");
      return null;
    }
  }
  //convertir position en ville
  Future<GeoPosition?>getVille()async{
    final position=await getPosition();
    if(position==null) return null;
    final lon = position.longitude??0.0;
    final lat = position.latitude??0.0;
    List<geocoding.Placemark>placemarks = await geocoding.placemarkFromCoordinates(lat,lon);
    //print(placemarks);
    final premierChoix=placemarks.first;
    GeoPosition laPosition =GeoPosition(ville:premierChoix.locality??"", lat: lat, lon:lon);
    return laPosition;
  }

  //convertir ville en position
  Future<GeoPosition?>getVilleEnPosition(String address)async{
   final laPosition = await geocoding.locationFromAddress(address);
   if(laPosition.isEmpty)return null;
   final choixDeCordoneeDeVille =laPosition.first;
   return GeoPosition(ville:address, lat:choixDeCordoneeDeVille.latitude, lon:choixDeCordoneeDeVille.longitude);
  }
}