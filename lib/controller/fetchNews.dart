// https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=9bb7bf6152d147ad8ba14cd0e7452f2f

import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';
import 'package:newsapp/model/newsArt.dart';

class FetchNews {
  static List sourcesId = [
    "abc-news",
    "bbc-news",
    "bbc-sport",
    "business-insider",
    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",
    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",
    "medical-news-today",
    "national-geographic",
    "news24",
    "new-scientist",
    "new-york-magazine",
    "next-big-future",
    "techcrunch",
    "techradar",
    "the-hindu",
    "the-wall-street-journal",
    "the-washington-times",
    "time",
    "usa-today",
  ];

  static Future<NewsArt> fetchNews() async {
    final _random = Random();
    var sourceId = sourcesId[_random.nextInt(sourcesId.length)];
    Response response = await get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?sources=$sourceId&apiKey=9bb7bf6152d147ad8ba14cd0e7452f2f'));
    Map bodyData = jsonDecode(response.body);
    List articles = bodyData['articles'];
    // print(articles);

    final _newRandom = Random();
    var myArticle = articles[_newRandom.nextInt(articles.length)];
    print(myArticle);

    return NewsArt.fromApiToApp(myArticle);
  }
}
