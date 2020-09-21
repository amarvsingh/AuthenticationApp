import 'package:authentication_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Logout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Logout",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Material(
        child: Container(
          child: SafeArea(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      logOut(context);
                    },
                    child: Container(
                      child: Text(
                        "Logout!",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [new BoxShadow(
                          color: Colors.black,
                          spreadRadius: 1.0,
                          blurRadius: 2.0,
                          offset: Offset(
                            3.0,
                            3.0,
                          ),
                        ),
                        ],
                      ),
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                        horizontal: 28.0,
                        vertical: 10.0,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                    ),
                  ),
                ],),
            ),
          ),
          decoration: BoxDecoration(gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.lightBlue,
                Colors.blue,
                Colors.deepPurpleAccent,
              ]
          )),
        ),
      ),
    );
  }

  void logOut(BuildContext context) async {
    final FirebaseAuth authLogOut = FirebaseAuth.instance;
    await authLogOut.signOut();
    print(context);
    Fluttertoast.showToast(msg: "Context: ${context}");
    Navigator.pop(context);
  }
}