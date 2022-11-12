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
  bool isLoading = true;
  late NewsArt newsArt;

  getNews() async {
    newsArt = await FetchNews.fetchNews();
    setState(() {
      isLoading = false;
    });
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
              setState(() {
                isLoading = true;
              });
              getNews();
            },
            itemBuilder: (context, index) {
              return isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : NewsContainer(
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
