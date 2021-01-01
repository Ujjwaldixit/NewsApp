

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app/apperance/article.dart';
import 'package:news_app/apperance/category.dart';
import 'package:news_app/apperance/categorymodel.dart';
import 'package:news_app/apperance/data.dart';
import 'package:news_app/apperance/news.dart';

import '../articleview.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> category=new List<CategoryModel>();
  List<Article> article=new List<Article>();
  bool loading=true;  //using this to check if news is loaded or not if loaded then show
  @override

  void initState() {
    // TODO: implement initState
     super.initState();
    category=getcategories();
    getnews();   //to get the catogories from data.dart
  }

  getnews() async{
    News newsclass =News();
    await newsclass.getnews();
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
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            


            Icon(
              Icons.ac_unit,
              size: 50,
              color: Colors.redAccent,
            ),
            SizedBox(width: 100),
            Text('Mobile' ,style:TextStyle(
                fontSize:40.0,
            color:Colors.blueAccent)),
            Text(' Tak',
            style:TextStyle(
              color: Colors.indigo,
              fontSize: 30.0

            ),
            ),
            Text(' ',
              style:TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 30.0

              ),
            ),

          ],
        )
      ),

      body:
      loading? Container(  // if loading is false show content else progress indicator
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

              //categories
              Container(
                  padding: EdgeInsets.symmetric(horizontal:10),
                height:70,

                child: ListView.builder(  // listview.builder is use to iterate through the list
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: category.length,
                  itemBuilder: (context,index)
                       {
                    return CategoryBlock(
                      imageurl:category[index].imageurl ,
                      categoryname: category[index].categoryname,
                     );
                    },)
              ),


              //news content
              Container(

                child:ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: article.length,

                  itemBuilder:(context,index){
                    return  Newsblock(
                      imageurl:article[index].urlToImage,
                      title: article[index].title,
                      desc: article[index].description ,
                      url: article[index].url,
                    );
                  }
                ,)
              )




            ],
          ),
        ),
      )
    );
  }
}



class CategoryBlock extends StatelessWidget {
  final imageurl, categoryname;
  CategoryBlock({this.imageurl,this.categoryname}); //

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=>Category(
            category:categoryname.toString().toLowerCase(),

          )
        ));
      },
      child: Container(

        margin: EdgeInsets.only(right: 10),
        padding:EdgeInsets.fromLTRB(10, 10, 10, 10) ,
        child:Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius:BorderRadius.circular(10),
                child: Image.network(imageurl,width:150,height:60,fit: BoxFit.fill,)),
            Container(
              padding: EdgeInsets.all(15), // to align text at center
              alignment: Alignment.center, // to align text at center

              child: Text(

                categoryname,style:TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,

                fontSize: 20,
              )
              ),

            ),
            SizedBox(height: 40,),
          ],
        )
      ),
    );
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
