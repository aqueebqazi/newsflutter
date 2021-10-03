import 'Views/home.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    home: Myapp(),
  ));
}

class Myapp extends StatefulWidget{
  @override
  _Myapp createState()=>_Myapp();
}
class _Myapp extends State<Myapp>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      title: 'Flutter News',
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primaryColor: Colors.white,
         // el
    ),
      home: home(),
    );
  }

}
