import 'package:flutter/material.dart';
//import 'package:google_fonts_arabic/fonts.dart';


void main() {
  // debugPaintSizeEnabled = true;
  runApp(new MaterialApp(
    home: searchPage(),
  ));
}

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final userNameController=new TextEditingController();
  final passwordController=new TextEditingController();



  var userName="";
  var password="";
  var result="";
  void readInputs() {
    setState(() {
      result="";
      var userNameEntry=userNameController.text;
      var passwordEntry=passwordController.text;
      if ((userNameEntry=="admin")&&(passwordEntry=="admin")){
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new hallsPage()));
        result="OK. Wellcome $result $userNameEntry";
      }else{
        result="Sorry. Wrong User Name or Password";

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
          child: ConstrainedBox(constraints: BoxConstraints(),
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
                          child: new TextField(controller: userNameController,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: 'اسم المستخدم'),
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
                          child: new TextField(controller: passwordController,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: 'كلمة المرور '),
                              style: new TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "Amiri"))),
                      new Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: new RaisedButton(onPressed: readInputs ,
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
                          child: new Text(result,
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
        )
    );
  }


}




class hallsPage extends StatelessWidget {
  final hallsList = [
    'صالة مزايا',
    'صالة الفريد',
    'صالة الحلو',
    'صالة بغداد',
    'صالة الجزيرة',
    'صالة الحرية',
    'صالة النورس',
    'بلس لايف',
    'قصر الورود'
  ];

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
              title: Text(
                hallsList[index],
                style: new TextStyle(fontSize: 25, color: Colors.lightGreen),
              ),
            );
          },
        ),
      ),
    );
  }
}
class searchPage extends StatefulWidget {
  @override
  _searchPageState createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  String fromDate="";
  String toDate="";

  DateTime _date =DateTime.now();
  Future<Null> selectFromDate(BuildContext context) async{
    final DateTime picked =await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2020),
        lastDate: DateTime(2030),);
    if(picked!=null && picked != _date){
      print(_date.toString());
      setState(() {
        fromDate=picked.toString();
      });
    }
  }

  Future<Null> selectToDate(BuildContext context) async{
    final DateTime picked =await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),);
    if(picked!=null && picked != _date){
      print(_date.toString());
      setState(() {
        toDate=picked.toString();
      });
    }
  }
//  final hallNameController=new TextEditingController();
//  final priceController=new TextEditingController();
//  final governorateController=new TextEditingController();
//  final cityController=new TextEditingController();
//  final dateFromController=new TextEditingController();
//  final dateToController=new TextEditingController();
//  final timeController=new TextEditingController();







  var result="";
  void readInputs() {
    setState(() {
      var hallNameEntry="";
      var priceEntry=  "";
      var cityEntry="";
      var dateFromEntry="";
      var dateToEntry="";
      var timeEntry="";
      var governorateEntry="";
      result="$hallNameEntry $priceEntry";

    });
  }
  List<String> governorateList=['gaza','northgaza'];
  @override
  Widget build(BuildContext context) {
    var governorateSelectedValue='gaza';
    var timeSelectedValue='am';


    return new Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: new AppBar(
          title: new Text("قاعة اون لاين"),
        ),
        body: SingleChildScrollView(
          child: ConstrainedBox(constraints: BoxConstraints(),
            child: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.all(5),
                        child: new Icon(Icons.search,
                            size: 60, color: Colors.greenAccent),
                      ),


                      new Padding(
                          padding: const EdgeInsets.all(5),
                          child: new Text(
                            "قم بتعبئة حقل او اكثر للبدء بعملية البحث",
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
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: 'اسم الصالة'),
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
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: 'السعر '),
                              style: new TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "Amiri")),
                      ),
                      new Padding(
                          padding: const EdgeInsets.all(5),
                          child: new Text(
                            "المحافظة",
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w200,
                              fontFamily: "Amiri",
                            ),
                          )),

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
                        child: Center(
                          child: DropdownButton<String>(
                            value: governorateSelectedValue,
                            items:
                            [
                            DropdownMenuItem(value: 'gaza', child: Text("غزة")),
                            DropdownMenuItem(value: 'northGaza', child: Text("شمال غزة")),
                            DropdownMenuItem(value: 'rafah', child: Text("رفح")),
                            DropdownMenuItem(value: 'khanyonis', child: Text("خانيونس")),
                            DropdownMenuItem(value: 'wosta', child: Text("الوسطى")),
                            ],
                            onChanged: (v) {

                              setState(() {
                                governorateSelectedValue=v;


                              });
                              print(governorateSelectedValue);
                            },
                          ),
                        ),
                      ),
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
                                border: InputBorder.none, hintText: 'المدينة '),
                            style: new TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w200,
                                fontFamily: "Amiri")),
                      ),
                      new Padding(
                          padding: const EdgeInsets.all(5),
                          child: new Text(
                            "بداية التاريخ",
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w200,
                              fontFamily: "Amiri",
                            ),
                          )),
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
                            onTap:(){selectFromDate(context);} ,

                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                              //labelText: fromDate.toString() ,
                              hintText: fromDate,
                                ),

                            style: new TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w200,
                                fontFamily: "Amiri")),
                      ),
                      new Padding(
                          padding: const EdgeInsets.all(5),
                          child: new Text(
                            "نهاية التاريخ",
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w200,
                              fontFamily: "Amiri",
                            ),
                          )),
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
                            onTap:(){selectToDate(context);} ,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              //labelText: toDate.toString() ,
                              hintText: toDate,
                            ),

                            style: new TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w200,
                                fontFamily: "Amiri")),
                      ),

                      new Padding(
                          padding: const EdgeInsets.all(5),
                          child: new Text(
                            "الفترة",
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w200,
                              fontFamily: "Amiri",
                            ),
                          )),
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
                          child: Center(
                            child: DropdownButton<String>(
                              value: timeSelectedValue,
                              items: [
                                DropdownMenuItem(value: 'am', child: Text("الفترة الصباحية")),
                                DropdownMenuItem(value: 'pm', child: Text("الفترة المسائية ")),

                              ],
                              onChanged: (v) {

                                setState(() {
                                  timeSelectedValue=v;


                                });
                                print(timeSelectedValue);
                              },
                            ),
                          ),


                      ),
                      new Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: new RaisedButton(onPressed: readInputs ,
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(40.0)),
                              key: null,
                              color: Colors.tealAccent,
                              child: new Text("بحث",
                                  style: new TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.amberAccent,
                                      fontWeight: FontWeight.w200,
                                      fontFamily: "Cairo")))),
                      new Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: new Text(result,
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
        )
    );
  }
}


