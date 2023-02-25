import 'package:flutter/material.dart';
import 'package:formation_flutter/exercice_meteo/modele/geo_code.dart';

class MaDrawer extends StatelessWidget{

  GeoPosition myPosition;
  List <String> cities;
  Function (String) onTap;
  Function (String) supprimer;

  MaDrawer({required this.myPosition,required this.cities,required this.onTap,required this.supprimer,super.key});

  @override
  Widget build(BuildContext context) {
    final itemCount = (myPosition == null)? cities.length+1:cities.length+2;
    return Drawer(
      child: ListView.separated(
          itemBuilder:((context,i){
            if(i == 0) return drawerHeader(context);
            if(i == 1 && myPosition !=null )return tappable(myPosition.ville,false);
            if(myPosition == null) return tappable(cities[i-1],true);
            return tappable(cities[i-2],true);
          }),
          separatorBuilder: ((context,i)=>const Divider()),
          itemCount: itemCount
      ),
    );
  }

  DrawerHeader drawerHeader(BuildContext context){
    return DrawerHeader(
        child:Column(
          children: [
            Icon(Icons.location_on_outlined,size: 32,color:Theme.of(context).primaryColor),
            const Text("Mes villes")
          ],
        )
    );
  }

  ListTile tappable(String string,bool canDelete){
    return ListTile(
      title: Text(string),
      onTap: (()=>onTap(string)),
      trailing: canDelete?IconButton(
          onPressed: (()=>supprimer(string)),
          icon: Icon(Icons.delete)
      ):null,
    );
  }

}