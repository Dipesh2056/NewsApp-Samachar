import 'package:flutter/material.dart';
import 'package:samachar/controller/fetchNews.dart';
import 'package:samachar/model/newsArt.dart';
import 'package:samachar/view/widgets/NewsContainer.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isLoading = true;
  late NewsArt newsArt;
  @override

  GetNews()  async{
   newsArt= await FetchNews.fetchNews();
   setState(() {
     isLoading = false;

   });
  }

  void initState() {
    GetNews();

    super.initState();
  }

  Widget build(BuildContext context) {
    return  Scaffold(

      body: PageView.builder(
        controller: PageController(initialPage: 0),
        scrollDirection:Axis.vertical ,
          onPageChanged: (value){
          setState(() {
            isLoading = true;
          });
            GetNews();
          },

          itemBuilder: (context, index){


          return isLoading ?Center(child: CircularProgressIndicator(),) :  NewsContainer(imgUrl: newsArt.imgUrl,
          newsHead: newsArt.newsHead,
              newsCnt:  newsArt.newsCnt,
             newsDes: newsArt.newsDes
             , newsUrl: newsArt.newsUrl);
      }),
    );
  }
}
