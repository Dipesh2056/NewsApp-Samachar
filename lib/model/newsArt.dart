class NewsArt{


  String imgUrl;
  String newsHead;
  String newsDes;
  String newsCnt;
  String newsUrl;


  NewsArt({

    required this.imgUrl, // required means need the data
    required this.newsCnt,//this means mentioned class data members needs the value
    required this.newsUrl,
    required this.newsDes,
    required this.newsHead,


});
  //Creating method

 static NewsArt fromAPItoApp(Map<String, dynamic> article){
  
  return NewsArt(
      imgUrl: article['urlToImage'] ?? "https://img.freepik.com/premium-vector/blue-breaking-news-dark-blue-background-illustration-vector-news-concept_194782-1404.jpg?w=2000",
      newsCnt: article['content'],
      newsUrl: article['url'] ?? 'https://news.google.com/home?hl=en-US&gl=US&ceid=US:en ',
      newsDes: article['description'] ?? '--',
      newsHead: article['title']
  );
  
}




}