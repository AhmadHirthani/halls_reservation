import 'package:flutter/material.dart';

class detailedSearchResultPage extends StatefulWidget {
  @override
  _detailedSearchResultPageState createState() =>
      _detailedSearchResultPageState();
}

class _detailedSearchResultPageState extends State<detailedSearchResultPage> {
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
          detailedOneSearchResult("صالة مزايا", "1000", "wi fi", "mzaya"),
        ],
      )),
    );
  }

  Card detailedOneSearchResult(
      String hallName, String hallPrice, String services, String imageName) {
    return Card(
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
          new Container(
            height: 50,
          ),
          new Container(
            child: new Image.asset(
              'assets/pics/$imageName.jpg',
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: <Widget>[
              new Text(
                "السعر $hallPrice",
                style: new TextStyle(fontSize: 20, color: Colors.cyanAccent),
              ),
              new Text(
                "الخدمات $services",
                style: new TextStyle(fontSize: 20, color: Colors.cyanAccent),
              ),
            ],
          )
        ],
      ),
    );
  }
}
