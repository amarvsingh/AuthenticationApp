import 'package:authentication_app/UI/signup_inputs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Signup",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Material(
        child: Container(
          child: SafeArea(
            child: SignupInputs(),
          ),
          decoration: BoxDecoration(gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.lightBlue,
                Colors.blue,
                Colors.deepPurpleAccent,
              ]
          ),),
        ),
      ),
    );
  }
}