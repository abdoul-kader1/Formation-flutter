import 'package:flutter/material.dart';

class LeCompteur with ChangeNotifier{

  int index =0;

  increment(){
    index++;
    notifyListeners();
  }

  initialise(){
    index=0;
    notifyListeners();
  }
}