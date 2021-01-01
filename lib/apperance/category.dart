import 'package:flutter/material.dart';
import 'package:news_app/apperance/article.dart';
import 'package:news_app/apperance/home.dart';
import 'package:news_app/articleview.dart';
import 'news.dart';
class Category extends StatefulWidget {
   String category;


  Category({this.category});   //

  @override
  _CategoryState createState() => _CategoryState();
}



class _CategoryState extends State<Category> {
  List<Article> article=new List<Article>();
  Category category=Category();  //

  bool loading=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcategory();
  }

  getcategory() async{
    CategoryClass newsclass =CategoryClass();  // CategoryClass is in news.dart
    await  newsclass.getnews(widget.category);
    article=newsclass.news;
    setState(() {
      loading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Mobile' ,style:TextStyle(
                  fontSize:40.0,
                  color:Colors.blueAccent)),
              Text('Tak',
                style:TextStyle(
                    color: Colors.indigo,
                    fontSize: 30.0

                ),
              ),
              Text('',
                style:TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 30.0

                ),
              ),

            ],
          )
      ),
      body: loading? Container(  // if loading is false show content else progress indicator
        child: Center(child: Container(
            height: 100,
            width: 100,

            child: CircularProgressIndicator(
              strokeWidth: 20,
              valueColor:AlwaysStoppedAnimation(Colors.indigoAccent),
            ))),
      ):



       SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Container(
              child: Column(
                children: <Widget>[
                  Container(

                      child:ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: article.length,

                        itemBuilder:(context,index){
                          return  Newsblock(

                            imageurl:article[index].urlToImage,
                            title: article[index].title,
                            desc: article[index].description,
                            url: article[index].url,

                          );
                        }
                        ,)
                  )

                ],
              ),
            ),
        ),
      );

    //);
  }
}





class Newsblock extends StatelessWidget {
  final String imageurl,title,desc,url;

  Newsblock({this.imageurl,this.title,this.desc,this.url});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=>Articleview(newsurl: url),
        ),
        );
      },
      child: Container(
        child: Column(children: <Widget>[
          ClipRRect(

            borderRadius: BorderRadius.circular(20),
            child: Image.network(imageurl
              ,),
          ),
          SizedBox(height: 30,),
          Text(title,
              style:TextStyle(
                color:Colors.indigo,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ) ),
          SizedBox(height: 20,),
          Text(desc ,style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),),
          SizedBox(height: 20,),
          Divider(
            color: Colors.red,
            thickness: 10,
            height: 100,
          )
        ],
        ),
      ),
    );
  }
}

