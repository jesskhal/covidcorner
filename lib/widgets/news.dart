import 'package:http/http.dart' as http;
import 'package:covid_corner/data/data.dart';
import 'package:covid_corner/widgets/article.dart';
import 'dart:convert';

//This class was made with reference to a flutter NewsApi example implementation
class News {
  List<Article> news = [];

  Future<void> getNews() async {
    //CREATE API JSON LINK
    String articleUrl =
        "https://newsapi.org/v2/top-headlines?country=ca&q=covid&apiKey=${newsApiKey}";

    var response = await http.get(articleUrl);
    //DECODE JSON DATA
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}
