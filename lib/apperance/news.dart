import 'dart:convert';

import 'package:news_app/apperance/article.dart';
import 'package:http/http.dart' as http ;
class News{
  List<Article> news=new List<Article>();

Future<void> getnews() async {

  String url1="http://newsapi.org/v2/top-headlines?country=in&apiKey=6a3088a7f123468eb7fcb8519221d520";
   var response=await http.get(url1);
   var jsondata=jsonDecode(response.body);

   if(jsondata['status']=='ok'){
    jsondata['articles'].forEach((element){  //iterating
       if(element['urlToImage']!=null && element['description']!=null)
         {
           Article article=Article(
             title:element['title'],
             author:element['author'],
             description: element['description'],
             url: element['url'],
             urlToImage:element['urlToImage'],

           );
          news.add(article);
         }
    });
   }
}

}




class CategoryClass{
  List<Article> news=new List<Article>();

  Future<void> getnews(String category) async {


    String url="http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=6a3088a7f123468eb7fcb8519221d520";
    var response=await http.get(url);
    var jsondata=jsonDecode(response.body);

    if(jsondata['status']=='ok'){
      jsondata['articles'].forEach((element){
        if(element['urlToImage']!=null && element['description']!=null)
        {
          Article article=Article(
            title:element['title'],
            author:element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage:element['urlToImage'],

          );
          news.add(article);
        }
      });
    }
  }

}
