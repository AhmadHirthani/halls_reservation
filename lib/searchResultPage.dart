import 'package:flutter/material.dart';

class searchResultPage extends StatefulWidget {
  @override
  _searchResultPageState createState() => _searchResultPageState();
}

class _searchResultPageState extends State<searchResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
        title: new Text(" قاعة اون لاين "),
    ),
    body: SingleChildScrollView(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //String hallName,String hallPrice, String services,String imageName
          oneSearchResultCard("صالة مزايا","1000","wi fi", "mzaya"),
        ],


      )



      ),
    );
  }
}
Card oneSearchResultCard(String hallName,String hallPrice, String services,String imageName){


  return new Card(
    child: new Column(
      children: <Widget>[
        new Text(hallName),
        new Container(
          child: new Image.asset(
            'assets/pics/$imageName.jpg',
            height: 200.0,
            fit: BoxFit.cover,
          ),

        ),
        new Row(children: <Widget>[
          new Text("التفاصيل",style: new TextStyle(fontSize: 20,color: Colors.cyanAccent),),
          new Text("السعر $hallPrice",style: new TextStyle(fontSize: 20,color: Colors.cyanAccent),),
          new Text("الخدمات $services",style: new TextStyle(fontSize: 20,color: Colors.cyanAccent),),


        ],

        )
      ],
    ),
  );
}



