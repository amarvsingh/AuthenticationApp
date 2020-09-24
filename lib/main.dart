import 'package:authentication_app/UI/homeButtons.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Fluttertoast.showToast(msg: "Aready Logged in? Tap on LOG IN!");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Authentication Application",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Material(
        child: Container(
          child: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image(
                  image: AssetImage("assets/images/logo1.png"),
                ),
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white.withOpacity(0.1),
                    width: 2.0,
                  ),
                  //color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              HomeButtons(),
            ],
          )),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.lightBlue,
                Colors.blue,
                Colors.deepPurpleAccent,
              ])),
        ),
      ),
    );
  }
}
