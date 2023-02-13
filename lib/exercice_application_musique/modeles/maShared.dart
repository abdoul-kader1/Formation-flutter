import 'package:shared_preferences/shared_preferences.dart';
class MyShared{

  final String maKey="lesDonnes";

  Future<bool>addItemToList(String value)async{
    final instance=await SharedPreferences.getInstance();
    final list= await getDonnee();
    list.add(value);
    await instance.setStringList(maKey,list);
    return true;
  }

  Future<bool>removeItemToList(String value)async{
    final instance= await SharedPreferences.getInstance();
    final list =await getDonnee();
    list.remove(value);
    await instance.remove(maKey);
    return true;
  }

  Future< List<String>>getDonnee()async{
    final instance=await SharedPreferences.getInstance();
    List<String>donnee= instance.getStringList(maKey)??[];
    return donnee;
  }
}