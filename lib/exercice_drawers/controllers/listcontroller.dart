import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../adapter_platform/android_ios.dart';

class ListController extends StatefulWidget {

 List menu;

  ListController({super.key,required this.menu});

  @override
  ListControllerState  createState() => ListControllerState();
}

class ListControllerState extends State<ListController>{

  late Widget menuActuel=widget.menu[0];

  @override
  Widget build(BuildContext context) {
    return AndroidIos().androidIosScaffold(
        couleur: Colors.lightGreen,
        drowers:Drawer(
          child: ListView.builder(
              itemCount:widget.menu.length+1,
              itemBuilder:(contexte,i){
                  if(i==0){
                    return SizedBox(
                      height: 80,
                      child: DrawerHeader(
                          decoration: BoxDecoration(
                              color: Colors.lightGreen
                          ),
                          child: infoUser()
                      ),
                    );
                }else{
                    final newIndex=widget.menu[i-1];
                    return ListTile(
                      title: Text("${newIndex.titre}"),
                      onTap: (){
                        setState(() {
                          menuActuel=newIndex;
                          Navigator.pop(context);
                        });
                      },
                    );
                  }
              }
          ),
        ),
        titre: Text("Mon jardin idéal"),
        corps:Center(
          child:menuActuel,
        )
    );
  }

  Row infoUser(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Bonjour Ahmed Abdoul-kader"),
        CircleAvatar(
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.white,
            child: Icon(Icons.person),
          ),
        )
      ],
    );
  }


}