import "package:flutter/material.dart";

void main() {
  runApp(MyApp(new Logic()));
}

class Logic {
  void doSomething() {
    print("doing something");
  }
}

class MyApp extends StatelessWidget {
  final Logic logic;

  MyApp(this.logic);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new HomePage(logic),
    );
  }
}

class HomePage extends StatelessWidget {
  final Logic logic;

  HomePage(this.logic);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => AnotherPage(logic),
              )
            );
          }
              ,
          child: Text("Go to AnotherPage"),
        ),
      ),
    );
  }
}

class AnotherPage extends StatelessWidget {
  final Logic logic;

  AnotherPage(this.logic);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: logic.doSomething,
          child: Text("Press me"),
        ),
      ),
    );
  }
}