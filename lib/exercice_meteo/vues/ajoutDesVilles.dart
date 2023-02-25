import 'package:flutter/material.dart';
class AjoutDesVilles extends StatelessWidget{

  TextEditingController controller =  TextEditingController();
  Function(String)ajoutVille;

  AjoutDesVilles({required this.ajoutVille});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child:TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Ajouter une ville"
              ),
            )
        ),
        IconButton(
            onPressed: (()=>ajoutVille(controller.text)),
            icon: Icon(Icons.send,color: Theme.of(context).primaryColorDark)
        )
      ],
    );
  }

}