import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

//void main() => runApp(hallsPage());
void main() => runApp(loginPage());

class loginPage extends StatelessWidget {
  String userName;
  String password;
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
            backgroundColor: Colors.pink[100],
            appBar: new AppBar(
              title: new Text("قاعة اون لاين"),
            ),
            body: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Padding(padding: const EdgeInsets.all(10),
                        child: new Icon(Icons.account_circle,
                            size: 80, color: Colors.greenAccent),
                      ),

                      new Padding(padding: const EdgeInsets.all(10),
                          child: new Text("تسجيل الدخول",
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                fontSize: 30.0,
                                color: Colors.red,
                                fontWeight: FontWeight.w200,
                                fontFamily: "Roboto",
                              ))),
                      new Padding(padding: const EdgeInsets.all(10),
                          child: new Text(
                            "قم بادخال اسم المستخدم وكلمة المرور لتسجيل الدخول",
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w200,
                              fontFamily: "Roboto",
                            ),
                          )),
                      //here

                      new Container(
                          width: 300,
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black26,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: new TextField(

                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'اسم المستخدم'),

                              style: new TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "Roboto"))),
                      new Container(
                          width: 300,
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black26,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: new TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'كلمة المرور '),
                              style: new TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "Roboto"))),
                      new Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: new RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(40.0)),
                              key: null,
                              color: Colors.tealAccent,

                              child: new Text("تسجيل الدخول",
                                  style: new TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.amberAccent,
                                      fontWeight: FontWeight.w200,
                                      fontFamily: "Roboto")))),
                      new Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: new Text(
                            "مستخدم جديد",
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                              fontSize: 20.0,
                              color: const Color(0xFFd71a1a),
                              fontWeight: FontWeight.w200,
                              fontFamily: "Roboto",
                            ),
                          ))
                    ]))));
  }
}
bool checkUserAndPassword(String userName,String password){
  if (userName=="a" && password=="a"){
    return true;
  }
  else return false;
}


class hallsPage extends StatelessWidget {
  final hallsList = ['صالة مزايا', 'صالة الفريد', 'صالة الحلو', 'صالة بغداد',
    'صالة الجزيرة', 'صالة الحرية', 'صالة النورس', 'بلس لايف', 'قصر الورود'];
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
        body: ListView.builder(
          itemCount: hallsList.length,
          itemBuilder: (context, index) {

            return ListTile(
              title: Text(hallsList[index],
                style: new TextStyle(fontSize: 25,color: Colors.lightGreen),),
            );
          },
        ),
      ),
    );
  }
}






