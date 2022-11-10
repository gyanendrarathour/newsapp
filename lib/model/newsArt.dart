class NewsArt {
  String imgUrl;
  String newsHead;
  String newsCnt;
  String newsDesc;
  String newsUrl;

  NewsArt(
      {required this.imgUrl,
      required this.newsHead,
      required this.newsCnt,
      required this.newsDesc,
      required this.newsUrl});

  static NewsArt fromApiToApp(Map<String, dynamic> article) {
    return NewsArt(
        imgUrl: article['urlToImage'] ??
            'https://img.freepik.com/premium-photo/text-breaking-news-news-graphic-with-lines-circular-shapes-studio-abstract-background-elegant-luxury-3d-illustration-style-news-template_510351-1801.jpg?w=2000',
        newsHead: article['title'] ?? '--',
        newsCnt: article['content'] ?? '--',
        newsDesc: article['description'] ?? '--',
        newsUrl: article['url'] ??
            'https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en');
  }
}
