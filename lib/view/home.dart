import 'package:flutter/material.dart';
import 'package:newsapp/controller/fetchNews.dart';
import 'package:newsapp/view/widgets/newsContainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FetchNews.fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 10,
            itemBuilder: (context, index) {
              FetchNews.fetchNews();
              return NewsContainer(
                  imgUrl:
                      'https://images.unsplash.com/photo-1588681664899-f142ff2dc9b1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
                  newsHead: '5G in India',
                  newsCnt: 'News Content',
                  newsDesc:
                      'Reliance Jio’s 5G service will be available in four cities of Delhi, Mumbai, Kolkata and Varanasi initially before it is expanded across the country by December 2023. The service provider decided to launch on the day of Dussehra (a major Indian festival celebrating the victory of good over evil) on October 5. The Jio subscribers will get unlimited data with 1 Gbps speed as part of the True 5G Welcome offer.',
                  newsUrl:
                      'https://www.fiercewireless.com/5g/india-says-hello-5g');
            }),
      ),
    );
  }
}
