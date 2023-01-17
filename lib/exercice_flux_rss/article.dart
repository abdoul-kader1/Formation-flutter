import 'package:webfeed/domain/rss_item.dart';
class Article{

  String?_title;
  String?_description;
  DateTime?_dateDePublication;
  String?_imgUrl;
  String?_urlLink;

  String get title=>_title??"Aucun titre pour ce article";
  String get imgUrl=>_imgUrl??"Aucune image pour ce article";
  String get description=>_description??"Aucune description pour ce article";
  String get urlLink=>_urlLink??"Aucun url pour ce article";
  DateTime get dateDePublication=>_dateDePublication??DateTime.now();

  Article({required RssItem item}){
    _title=item.title;
    _description=item.description;
    _dateDePublication=item.pubDate;
    _imgUrl=item.enclosure?.url;
    _urlLink=item.link;
  }

}