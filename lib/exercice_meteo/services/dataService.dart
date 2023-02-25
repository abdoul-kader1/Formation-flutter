import 'package:shared_preferences/shared_preferences.dart';

class DataService{

  final key ="cities";

  //obtenir
  Future<List<String>>getCitie()async{
    final preferences = await SharedPreferences.getInstance();
    final list = preferences.getStringList(key);
    return list??[];
  }
  //ajouter
  Future<bool>addCitie(String valeur)async{
    final pref = await SharedPreferences.getInstance();
    var list = pref.getStringList(key)??[];
    list.add(valeur);
    return pref.setStringList(key,list);
  }
  //supprimer
  Future<bool>supprCitie(String valeur)async{
    final pref = await SharedPreferences.getInstance();
    var list = pref.getStringList(key)??[];
    list.remove(valeur);
    return pref.setStringList(key,list);
  }

}