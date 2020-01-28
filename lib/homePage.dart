



import 'package:flutter/material.dart';
import 'package:halls_reservation/searchResultPage.dart';
import 'package:halls_reservation/hallsList.dart';
import 'package:intl/intl.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;



class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage>
    with SingleTickerProviderStateMixin {
  var governorateSelectedValue = 'gaza';
  var timeSelectedValue = 'pm';
  var hallNameSelectedValue = 'mzaya';

  static DateTime _startDate = DateTime.now();
  static DateTime _endDate = DateTime.now().add(Duration(days: 1));
  DateTime _selectedStartDate;
  DateTime _selectedEndDate;
  String _formatedStartDate = DateFormat('yyyy-MM-dd').format(_startDate);
  String _formatedEndDate = DateFormat('yyyy-MM-dd').format(_endDate);

  Future displayDateRangePicker(BuildContext context) async {
    final List<DateTime> picked = await DateRangePicker.showDatePicker(
        context: context,
        initialFirstDate: _startDate,
        initialLastDate: _endDate,
        firstDate: new DateTime(DateTime.now().year - 5),
        lastDate: new DateTime(DateTime.now().year + 5));
    if (picked != null && picked.length == 2) {
      setState(() {
        _selectedStartDate = picked[0];
        _selectedEndDate = picked[1];
        _formatedStartDate =
            DateFormat('yyyy-MM-dd').format(_selectedStartDate);
        _formatedEndDate = DateFormat('yyyy-MM-dd').format(_selectedEndDate);
        print("hello $_formatedStartDate");
      });
    }
  }

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

//  final hallNameController=new TextEditingController();
//  final priceController=new TextEditingController();
//  final governorateController=new TextEditingController();
//  final cityController=new TextEditingController();
//  final dateFromController=new TextEditingController();
//  final dateToController=new TextEditingController();
//  final timeController=new TextEditingController();

  var result = "";

  void readInputs() {
    setState(() {
      var hallNameEntry = "";
      var priceEntry = "";
      var cityEntry = "";
      var dateFromEntry = "";
      var dateToEntry = "";
      var timeEntry = "";
      var governorateEntry = "";
      result = "$hallNameEntry $priceEntry";
    });
  }

  List<String> governorateList = ['gaza', 'northgaza'];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: new AppBar(
          bottom: TabBar(controller: tabController, tabs: [
            Text("بحث سريع"),
            Text("بحث متقدم"),
          ]),
          title: new Text("قاعة اون لاين"),
        ),
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(),
                child: new Center(
                    child: new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.all(5),
                        child: new Icon(Icons.search,
                            size: 60, color: Colors.blue[900]),
                      ),

                      new Padding(
                          padding: const EdgeInsets.all(5),
                          child: new Text(
                            "احصل على أفضل عروض تأجير القاعات",
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w200,
                              fontFamily: "Cairo",
                            ),
                          )),
                      //here

                      hallNameDropDownList(),

                      datePickerTextbox(),

                      searchButton(),
                    ])),
              ),
            ),
            SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(),
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
                            items: [
                              DropdownMenuItem(
                                  value: 'gaza', child: Text("غزة")),
                              DropdownMenuItem(
                                  value: 'northGaza', child: Text("شمال غزة")),
                              DropdownMenuItem(
                                  value: 'rafah', child: Text("رفح")),
                              DropdownMenuItem(
                                  value: 'khanyonis', child: Text("خانيونس")),
                              DropdownMenuItem(
                                  value: 'wosta', child: Text("الوسطى")),
                            ],
                            onChanged: (v) {
                              setState(() {
                                governorateSelectedValue = v;
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

                      datePickerTextbox(),

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
                              DropdownMenuItem(
                                  value: 'am', child: Text("الفترة الصباحية")),
                              DropdownMenuItem(
                                  value: 'pm', child: Text("الفترة المسائية ")),
                            ],
                            onChanged: (v) {
                              setState(() {
                                timeSelectedValue = v;
                              });
                              print(timeSelectedValue);
                            },
                          ),
                        ),
                      ),
                      searchButton(),
                      new RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
//            new MaterialPageRoute(builder: (context) => new hallsPage()));
                                new MaterialPageRoute(
                                    builder: (context) => new hallsPage()));
                          },
                          child: new Text("Halls Page")),
                          new RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
//            new MaterialPageRoute(builder: (context) => new hallsPage()));
                                    new MaterialPageRoute(
                                        builder: (context) => new searchResultPage()));
                              },
                              child: new Text("Results Page"))
                    ])),
              ),
            )
          ],
        ));
  }

  Container searchButton() {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: RaisedButton(
            onPressed: readInputs,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(40.0)),
            key: null,
            color: Colors.tealAccent,
            child: new Text("بحث",
                style: new TextStyle(
                    fontSize: 25.0,
                    color: Colors.amberAccent,
                    fontWeight: FontWeight.w200,
                    fontFamily: "Cairo"))));
  }

  datePickerTextbox() {
    return Column(
      children: <Widget>[
        new Padding(
            padding: const EdgeInsets.all(5),
            child: new Text(
              " التاريخ",
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
              onTap: () async {
                await displayDateRangePicker(context);
              },
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "$_formatedStartDate - $_formatedEndDate",
              ),
              style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w200,
                  fontFamily: "Amiri")),
        ),
      ],
    );
  }

  Column hallNameDropDownList() {
    return new Column(
      children: <Widget>[
        new Padding(
            padding: const EdgeInsets.all(5),
            child: new Text(
              "اسم الصالة",
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
              value: hallNameSelectedValue,
              items: [
                DropdownMenuItem(value: 'mzaya', child: Text("صالة مزايا")),
                DropdownMenuItem(
                    value: 'grandpalas', child: Text("صالة جراند بالاس")),
                DropdownMenuItem(value: 'freed', child: Text("صالة الفريد")),
                DropdownMenuItem(value: 'helo', child: Text("صالة الحلو")),
                DropdownMenuItem(value: 'saad', child: Text("صالة السعد")),
                DropdownMenuItem(value: 'saad', child: Text("صالة مونتانا")),
              ],
              onChanged: (v) {
                setState(() {
                  hallNameSelectedValue = v;
                });
                print(hallNameSelectedValue);
              },
            ),
          ),
        ),
      ],
    );
  }
}
