class Video{

  String titre;
  String coverImg;
  String video;

  Video({required this.titre,required this.coverImg,required this.video});

  static videosDefaut(String choix){
    if(choix=="Nature"){
      return[
        Video(titre: "Gros plan des gouttes de pluie tombant sur les feuilles",coverImg: "https://joy1.videvo.net/videvo_files/video/free/2021-04/customThumbnails/210329_06B_Bali_1080p_013_6089761f10c35_small.jpg",video: "https://joy1.videvo.net/videvo_files/video/free/2021-04/small_watermarked/210329_06B_Bali_1080p_013_preview.mp4"),
        Video(titre: "Vue aérienne de la cascade sur une montagne verdâtre",coverImg: "https://joy1.videvo.net/videvo_files/video/free/video0467/thumbnails/_import_615435000f6eb2.81789495_small.jpg",video: "https://joy1.videvo.net/videvo_files/video/free/video0467/small_watermarked/_import_615435000f6eb2.81789495_preview.mp4"),
      ];
    }else if(choix=="l'univers"){
      return[
        Video(titre: "l'univers et son contenu",coverImg: "https://joy.videvo.net/videvo_files/video/premium/partners0200/thumbnails/BB_b17284cd-61ff-4c97-8b96-4b7e35854e64_small.jpg",video: "https://joy.videvo.net/videvo_files/video/premium/partners0200/small_watermarked/BB_b17284cd-61ff-4c97-8b96-4b7e35854e64_preview.mp4"),
        Video(titre: "Animation 3D du vol spatial à travers l'espace vers la nébuleuse pulsée bleue",coverImg: "https://joy1.videvo.net/videvo_files/video/free/video0467/thumbnails/_import_61516692993d77.04238324_small.jpg",video: "https://joy1.videvo.net/videvo_files/video/free/video0467/small_watermarked/_import_61516692993d77.04238324_preview.mp4"),
      ];
    }else if(choix=="La mere"){
      return [
        Video(titre: "Ordinateur de poche gros plan de vagues sur Echo Beach Shore au coucher du soleil",coverImg: "https://joy1.videvo.net/videvo_files/video/free/2021-04/customThumbnails/210329_01B_Bali_1080p_027_608974f5b8e66_small.jpg",video: "https://joy1.videvo.net/videvo_files/video/free/2021-04/small_watermarked/210329_01B_Bali_1080p_027_preview.mp4"),
        Video(titre: "Coucher du soleil à Venice Beach LA",coverImg: "https://joy1.videvo.net/videvo_files/video/free/2019-01/thumbnails/181015_13_Venice Beach Drone_25_small.jpg",video: "https://joy1.videvo.net/videvo_files/video/free/2019-01/small_watermarked/181015_13_Venice Beach Drone_25_preview.mp4")
      ];
    }
  }
}