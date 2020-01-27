import 'package:flutter/material.dart';
import 'package:halls_reservation/screens/auth/sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'hallsList.dart';
import 'mainPage.dart';
import 'models/FirebaseServices.dart';


void main() {
  // debugPaintSizeEnabled = true;
  runApp(new MaterialApp(
    home: mainPage(),
//    home: SignIn(),
  //  home: HallsPage(),
//    home: hallsPage(),
  ));
}

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final userNameController = new TextEditingController();
  final passwordController = new TextEditingController();

  var userName = "";
  var password = "";
  var result = "";


  void readInputs() {
    setState(() {
      result = "";
      var userNameEntry = userNameController.text;
      var passwordEntry = passwordController.text;
      if ((userNameEntry == "admin") && (passwordEntry == "admin")) {

        result = "OK. Wellcome $result $userNameEntry";
      } else {
        result = "Sorry. Wrong User Name or Password";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: new AppBar(
          title: new Text("قاعة اون لاين"),
        ),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(),
            child: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.all(5),
                    child: new Icon(Icons.account_circle,
                        size: 60, color: Colors.greenAccent),
                  ),

                  new Padding(
                      padding: const EdgeInsets.all(5),
                      child: new Text(
                        "قم بادخال اسم المستخدم وكلمة المرور لتسجيل الدخول",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                          fontFamily: "Cairo",
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
                          controller: userNameController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'اسم المستخدم'),
                          style: new TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w200,
                              fontFamily: "Amiri"))),
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
                          controller: passwordController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'كلمة المرور '),
                          style: new TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w200,
                              fontFamily: "Amiri"))),
                  new Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: new RaisedButton(
                          onPressed: readInputs,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(40.0)),
                          key: null,
                          color: Colors.tealAccent,
                          child: new Text("تسجيل الدخول",
                              style: new TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.amberAccent,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "Cairo")))),
                  new Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: new Text(
                        result,
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          fontSize: 20.0,
                          color: const Color(0xFFd71a1a),
                          fontWeight: FontWeight.w200,
                          fontFamily: "Roboto",
                        ),
                      ))
                ])),
          ),
        ));
  }
}
//
//class hallsPage extends StatelessWidget {
////  final hallsList = [ 'صالة مزايا','صالة الفريد','صالة الحلو','صالة بغداد','صالة الجزيرة', 'صالة الحرية','صالة النورس','بلس لايف','قصر الورود'];
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: 'قائمة الصالات',
//      theme: ThemeData(
//        primarySwatch: Colors.teal,
//      ),
//      home: Scaffold(
//        appBar: AppBar(title: Text('قائمة الصالات')),
//        body: ListView.builder(
//          itemCount: hallsList.length,
//          itemBuilder: (context, index) {
//            return ListTile(
//              title: Text(
//                hallsList[index],
//                style: new TextStyle(fontSize: 25, color: Colors.lightGreen),
//              ),
//            );
//          },
//        ),
//      ),
//    );
//  }
//}



