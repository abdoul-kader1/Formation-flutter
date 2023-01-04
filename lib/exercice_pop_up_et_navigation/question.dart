class Questions{
  String question;
  bool reponse;
  String explication;
  String img;

  Questions({required this.question,required this.reponse,required this.explication,required this.img});

  static List <Questions>liste(){
    List<Questions>liste=[
      Questions(question:"La devise de la belgique est:l'union fait la force", reponse:true, explication:"", img:"lib/exercice_pop_up_et_navigation/assets_quizz/belgique.JPG"),
      Questions(question:"La lune va finir par tomber sur terre à cause de la gravité", reponse:false, explication:"Au contraire la lune s'éloigne",img:"lib/exercice_pop_up_et_navigation/assets_quizz/lune.jpg"),
      Questions(question:"La Russie est plus grande en superficie que Pluton", reponse:true, explication:"", img:"lib/exercice_pop_up_et_navigation/assets_quizz/russie.jpg"),
      Questions(question:"Nyctalope est une race naine d'antilope", reponse:false, explication:"C’est une aptitude à voir dans le noir", img:"lib/exercice_pop_up_et_navigation/assets_quizz/nyctalope.jpg"),
      Questions(question:"Le Commodore 64 est l'oridnateur de bureau le plus vendu", reponse:true, explication:"", img:"lib/exercice_pop_up_et_navigation/assets_quizz/commodore.jpg"),
      Questions(question:"Le nom du drapeau des pirates es black skull", reponse:false, explication:"Il est appelé Jolly Roger", img:"lib/exercice_pop_up_et_navigation/assets_quizz/pirate.png"),
      Questions(question:"Haddock est le nom du chien Tintin", reponse:false, explication:"C'est Milou", img:"lib/exercice_pop_up_et_navigation/assets_quizz/tintin.jpg"),
      Questions(question:"La barbe des pharaons était fausse", reponse:true, explication:"A l'époque déjà ils utilisaient des postiches", img:"lib/exercice_pop_up_et_navigation/assets_quizz/pharaon.jpg"),
      Questions(question:"Au Québec tire toi une bûche veut dire viens viens t'asseoir", reponse:true, explication:"La bûche, fameuse chaise de bucheron", img:"lib/exercice_pop_up_et_navigation/assets_quizz/buche.jpg"),
      Questions(question:"Le module lunaire Eagle de possédait de 4Ko de Ram", reponse:true, explication:"Dire que je me plains avec mes 8GO de ram sur mon mac", img:"lib/exercice_pop_up_et_navigation/assets_quizz/eagle.jpg")
    ];
    return liste;
  }
}