import 'dart:convert';
import 'package:flutternews/models/Artcilemodel.dart';
import 'package:http/http.dart'as http;
class News {
 List<ArticleModel> news=[];
 Future<void> getnews()async{
   String url="https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=75c1945aa84e4c32a70373a80ef57c3d";
   var Response= await http.get(Uri.parse(url));
   var JsonData=jsonDecode(Response.body);
  if(JsonData['status']=="ok") {
    JsonData['articles'].forEach((element) {
      if(element["urlToImage"]!=null && element['description']!=null) {
        ArticleModel articleModel = new ArticleModel(author: element['author'],
            title: element['title'],
            description: element['description'],
            urltoimage: element['urlToImage'],
            content: element['content']);
        news.add(articleModel);
        print(JsonData);
      }
    });
  }


 }
}