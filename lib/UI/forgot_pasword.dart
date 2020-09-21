import 'package:authentication_app/UI/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPassword extends StatelessWidget{
  //To declare database references
  final FirebaseAuth authForgotPassword = FirebaseAuth.instance;

  //To declare all the variables required for input fields
  String email = "";
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Forgot Password",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Material(
        child: Container(
          child: SafeArea(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "Reset Password",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      //color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.white, width: 2.0),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 15.0,
                    ),
                  ),
                  TextField(
                    onChanged: (emailInput){
                      email = emailInput;
                    },
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                      labelText: "Enter registerd email address:",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      validateAndSendLink(email, context);
                    },
                    child: Container(
                      child: Text(
                        "SEND LINK!",
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
                        ),],
                      ),
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                        horizontal: 28.0,
                        vertical: 25.0,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                    ),
                  ),
                ],),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 3.0,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 30.0,
                ),
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
  //To validate the email entered
  void validateAndSendLink(String email, BuildContext context) {
    if (email.isNotEmpty){
      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern);
      if (regex.hasMatch(email)){
        SendLink(email, context);
      }
      else{
        //To handle the error if the email format is incorrect
        Fluttertoast.showToast(msg: "Please enter a valid email address!");
      }
    }
    else{
      //To handle the error if the field is empty
      Fluttertoast.showToast(msg: "Please fill all the fields!");
    }
  }
  //To implement the reset password link on the registered email address
  Future<void> SendLink(String email, BuildContext context) async {
    try{
      await authForgotPassword.sendPasswordResetEmail(email: email);
      Fluttertoast.showToast(msg: "The link to reset the password has been sent to your registered email address!");
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login())
      );
    }
    catch(e){
      //To handle in case of unknown email address entered
      Fluttertoast.showToast(msg: "Please enter a registered email address");
    }
  }
}