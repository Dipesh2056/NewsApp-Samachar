import 'package:flutter/material.dart';
import 'package:samachar/view/detail_view.dart';
import 'package:samachar/view/home.dart';

class NewsContainer extends StatelessWidget {


  String imgUrl;
  String newsHead;
  String newsDes;
  String newsUrl;
  String newsCnt;

   NewsContainer({
    super.key,
     required this.imgUrl,
     required this.newsHead,
     required this.newsDes,
     required this.newsCnt,
     required this.newsUrl,

});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,


      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start ,
        children:[
          FadeInImage.assetNetwork(
              height: 400,
              width: MediaQuery.of(context).size.width,
              fit:BoxFit.cover,
              placeholder: "assets/img/pic.jpg", image:  imgUrl),

          Container(
            padding: EdgeInsets.symmetric(horizontal:20 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                Text(
                  newsHead.length >90 ?
                  "${newsHead.substring(0,90)}...." : newsHead,
                  style:TextStyle(fontSize: 25,
                    fontWeight: FontWeight.bold
                ) ,),
                SizedBox(height: 30,),
                Text(newsDes,style: TextStyle(fontSize: 12, color: Colors.black38),),
                SizedBox(height: 30,),
                Text(
                  newsCnt != "--" ?
                  newsCnt.length > 250 ? newsCnt.substring(0,250):

                  "${newsCnt.toString().substring(0,newsCnt.length-15)}...": newsCnt,
                  style: TextStyle(fontSize: 12),),

              ],
            ),
          ),


          Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20 ),
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailViewScreen(newsUrl: newsUrl)));

                }, child: Text("Read more")),
              ),
            ],
          ),
          SizedBox(height: 25,)



        ],
      ),
    );
    ;
  }
}
