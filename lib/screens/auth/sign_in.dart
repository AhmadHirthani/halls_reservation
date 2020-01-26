import 'package:flutter/material.dart';
import 'package:halls_reservation/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
            backgroundColor: Colors.brown[400],
            elevation: 0.0,
            title: Text("Sign in to Halls Reservation App")),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
            child: RaisedButton(
                child: Text('Sign In Anon'), onPressed: () async {
                        dynamic result =  await _auth.signInAnnon();
                        if (result == null ){
                          print("error signing in");
                        }else{
                          print("signed In");
                          print(result) ;
                        }
            })));
  }
}
