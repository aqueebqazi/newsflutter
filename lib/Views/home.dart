import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutternews/helper/News.dart';
import 'package:flutternews/helper/data.dart';
import 'package:flutternews/models/Artcilemodel.dart';
import 'package:flutternews/models/Categori_model.dart';
class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  List<CategoryModel> categorymodel = new List<CategoryModel>();
  List<ArticleModel> artciles = new List<ArticleModel>();
  bool _loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categorymodel=getCategories();
    getnews();
  }
  getnews() async  {
    News newclass =News();
    newclass.getnews();
    artciles= newclass.news;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text("Flutter"),
           Text("news",style: TextStyle(color: Colors.blue),)
         ],
       ),
        elevation: 0.0,
      ),
body:
 SingleChildScrollView(
   child: Column(
     children: [
         Column(
           children: [
             Container(
                 height: 70,
                 child: ListView.builder(
                     shrinkWrap: true,
                     scrollDirection: Axis.horizontal,
                     itemCount: categorymodel.length,
                     itemBuilder: (context,index)
                     {
                       return CategoryTile(
                         imageUrl: categorymodel[index].imageUrl,
                         categoryname: categorymodel[index].categoryname,
                       );
                     })
             ),
             SizedBox(
               height: 12,
             ),
             SingleChildScrollView(
               child: Container(
                 height: 1200,
                 width: 700,
                 child: ListView.builder(
                     shrinkWrap: true,
                     itemCount: artciles.length,
                     itemBuilder: (context, index){
                       return BlogTile(
                         imgUrl: artciles[index].urltoimage,
                         title: artciles[index].title,
                         desc: artciles[index].description,
                       );

                     }

                 ),
               ),
             ),
           ],
         )
         


     ],
   ),
 )
    );
  }
}
class CategoryTile extends StatelessWidget {
  final  imageUrl,categoryname;
  CategoryTile({this.imageUrl,this.categoryname});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.only(right: 16),
        padding: EdgeInsets.all(3.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(7),
                child: Image.network(imageUrl,width:120,height: 70,fit: BoxFit.cover,)),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.black26
              ),
              child: Text(
                categoryname,style: TextStyle(
                color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500
              ),),
            )
          ],
        ),

      ),
    );
  }
}
class BlogTile extends StatelessWidget {
  final String imgUrl,title,desc;
  BlogTile({  this.imgUrl,this.title,this.desc});
  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
            child: Column(
              children: [

                      Container(
                        margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child:  Column(
                          children: [
                         Image.network(imgUrl),
                         Text(title,style: TextStyle(color: Colors.black,fontSize: 18),),
                         Text(desc,style: TextStyle(color: Colors.black87,fontSize: 16),),
                          ],
                        )
                      ),
              ],
            ),



      );
  }
}
