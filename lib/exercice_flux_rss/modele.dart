import 'package:http/http.dart' as http;
import 'package:webfeed/domain/rss_feed.dart';

import 'article.dart';

class LeModele {

  Future<List<Article>> recuperFluxRss(String url)async{
    List<Article>article=[];
    final conversionUrl= Uri.parse(url);
    final client=http.Client();
    final  requeteClient= await client.get(conversionUrl);
    final fluxRss=RssFeed.parse(requeteClient.body);
    final items=fluxRss.items;
    if(items!=null){
        items.forEach((element) {
          article.add(Article(item:element));
        });
    }
    return article;
  }
}