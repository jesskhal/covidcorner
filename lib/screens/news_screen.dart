import 'package:flutter/material.dart';
import 'package:covid_corner/widgets/custom_app_bar.dart';
import 'package:covid_corner/widgets/news.dart';
import 'package:covid_corner/widgets/news_box.dart';

//News screen design inspired by
// https://github.com/peakcool/flutter_news_watch &
// https://github.com/theindianappguy/FlutterNewsApp
//This class was made with reference to a flutter NewsApi example implementation
class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  bool _loading;
  var newsList;

  @override
  void initState() {
    _loading = true;
    super.initState();
    getNews();
  }

  void getNews() async {
    News news = News();
    await news.getNews();
    newsList = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarNews(),
      body: SafeArea(
        child: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: ListView.builder(
                            itemCount: newsList.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return NewsBox(
                                imgUrl: newsList[index].urlToImage ?? "",
                                desc: newsList[index].description ?? "",
                                title: newsList[index].title ?? "",
                                articleUrl: newsList[index].articleUrl ?? "",
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
