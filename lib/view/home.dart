import 'package:flutter/material.dart';
import 'package:newsapp/controller/fetchNews.dart';
import 'package:newsapp/model/newsArt.dart';
import 'package:newsapp/view/widgets/newsContainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NewsArt newsArt;

  getNews() async {
    newsArt = await FetchNews.fetchNews();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getNews();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
            scrollDirection: Axis.vertical,
            onPageChanged: (value) {
              getNews();
            },
            itemBuilder: (context, index) {
              return NewsContainer(
                  imgUrl: newsArt.imgUrl,
                  newsHead: newsArt.newsHead,
                  newsCnt: newsArt.newsCnt,
                  newsDesc: newsArt.newsDesc,
                  newsUrl: newsArt.newsUrl);
            }),
      ),
    );
  }
}
