import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class AndroidIos{

  bool verifiePlatform=(defaultTargetPlatform==TargetPlatform.iOS);

  //Material et cupertino
   Widget materialCupertinoApp({required Widget home}){
    return(verifiePlatform)?CupertinoApp(
      theme:const CupertinoThemeData(brightness:Brightness.light),
      debugShowCheckedModeBanner: false,
      title: 'Formation flutter',
      home: home,
    ):MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      title: 'Formation flutter',
      home: home,
      darkTheme:ThemeData.dark(),
    );
  }

  //scaffold et cupetinoPageScaffold
  Widget androidIosScaffold({required Widget titre,TabBar?tabar, Widget?corps, Color?couleur,List<Widget>?action,Widget?trailing,FloatingActionButton?floatingActionButton,Drawer?drowers}){
    return (verifiePlatform)?CupertinoPageScaffold(
      navigationBar:CupertinoNavigationBar(
        trailing:trailing,
        middle:titre,
        backgroundColor:couleur,
      ),
      child:corps!
    ):Scaffold(
      drawer: drowers,
      appBar: AppBar(
        title: titre,
        backgroundColor:couleur,
        actions:action,
        bottom:tabar,
      ),
      body: corps,
      floatingActionButton:floatingActionButton
    );
  }

  //elevatedButton et cupertinoButton
  Widget boutton({required String titre,required void Function()onPress, ButtonStyle?style}){
     return (verifiePlatform)?CupertinoButton.filled(
         onPressed:onPress,
       child:Text(titre),
     ):ElevatedButton(
         onPressed:onPress,
         style:style,
         child:Text(titre)
     );
  }

  //textfield et cupertino textfield
  Widget textfieldMaterialCupertion({required TextInputType typeInput,String?placeholder,bool textobscure=false,required void Function(String)onChange,required InputDecoration decorationInput}){
     return (verifiePlatform)?CupertinoTextField(
       padding: const EdgeInsets.all(16),
       placeholder:placeholder,
       obscureText: textobscure,
       decoration: BoxDecoration(
         color:CupertinoColors.extraLightBackgroundGray,
         borderRadius:BorderRadius.circular(8),
         border: Border.all(
           color: CupertinoColors.lightBackgroundGray
         )
       ),
       onChanged:onChange,
     ):TextField(
       keyboardType:typeInput,
       obscureText:textobscure,
       onChanged:onChange,
       decoration:decorationInput,
     );
  }

  //switch et cupertino switch
  Widget switchMaterailCupertino({Color?couleur,required bool valeur,required void Function(bool)onChange}){
    return (verifiePlatform)?CupertinoSwitch(
        activeColor: couleur,
        value: valeur,
        onChanged: onChange
    ):Switch(
      activeColor: couleur,
        value: valeur,
        onChanged:onChange
    );
  }

  //Slider et cupertino slider
  Widget sliderMaterialCupertino({Color?couleurActive,Color?couleurinActive,double min=0.0,double max=0.0,required double valeur,required void Function(double)onChange}){
    return (verifiePlatform)?CupertinoSlider(
        activeColor: couleurActive,
        min:min,
        max:max,
        value: valeur,
        onChanged:onChange
    ):Slider(
        activeColor:couleurActive,
        inactiveColor: couleurinActive,
        value:valeur,
        onChanged:onChange,
        min:min,
        max:max,
    );
  }

  //Alert dialogue et cupertino alert dialogue
  Widget alertDialogueMaterialCupertino({required EdgeInsetsGeometry contentPadding,List<Widget>?children}){
    return (verifiePlatform)?const CupertinoAlertDialog(

    ):SimpleDialog(
      contentPadding:contentPadding,
      children:children,
    );
  }


}