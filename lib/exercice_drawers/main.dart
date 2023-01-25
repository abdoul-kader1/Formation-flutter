import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formation_flutter/exercice_drawers/vues/vue_jardin.dart';
import 'package:formation_flutter/exercice_drawers/vues/vue_realisation.dart';

import 'controllers/listcontroller.dart';


class Drawers extends StatelessWidget{

  String title= "Exercice Drawers";
  String img ="lib/image menu/drawers.jpg";
  int index=0;
  List<Widget> menu=[VueJardin(),VueRealisation()];
  @override
  Widget build(BuildContext context) {
    return ListController(menu:menu);
  }

}