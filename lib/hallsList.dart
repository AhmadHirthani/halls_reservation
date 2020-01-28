import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class hallsList extends StatelessWidget {
  final  stream =  Firestore.instance.collection("halls").getDocuments().asStream();

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(
      stream: stream ,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Text('Loading...');
        return new ListView(
          children: snapshot.data.documents.map((document) {
            return new ListTile(
              title: new Text(document['hall_id']),
              subtitle: new Text(document['hall_name']),
            );
          }).toList(),
        );
      },
    );
  }
}

class hallsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'قائمة الصالات',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('قائمة الصالات')),
        body:
        hallsList(),
      ),
    );
  }
}