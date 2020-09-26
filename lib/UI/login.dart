import 'package:authentication_app/UI/dashboard.dart';
import 'package:authentication_app/UI/forgot_pasword.dart';
import 'package:authentication_app/UI/logout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  //Declaring Database references
  final FirebaseAuth authLogIn = FirebaseAuth.instance;

  //To declare the variables required for the inputs
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.aBeeZeeTextTheme(
            Theme.of(context).textTheme,
          )),
      home: Material(
        child: Container(
          child: SafeArea(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Enter the Credentials",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                    margin: EdgeInsets.all(20),
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
                    onChanged: (emailInput) {
                      email = emailInput;
                    },
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                      labelText: "Enter the Email:",
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
                  TextField(
                    onChanged: (passwordInput) {
                      password = passwordInput;
                    },
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                      labelText: "Enter the Password:",
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
                    obscureText: true,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPassword()));
                      },
                      child: Container(
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        margin: EdgeInsets.all(10.0),
                        padding: EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 5.0,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      validateAndLogin(email, password, context);
                    },
                    child: Container(
                      child: Text(
                        "LOG IN!",
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
                        boxShadow: [
                          new BoxShadow(
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
                        horizontal: 30.0,
                        vertical: 30.0,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 20.0,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 3.0,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.lightBlue,
                  Colors.blue,
                  Colors.deepPurpleAccent,
                ]),
          ),
        ),
      ),
    );
  }

  //Method to validate the inputs
  void validateAndLogin(String email, String password, BuildContext context) {
    if (email.isNotEmpty && password.isNotEmpty) {
      //Pattern matching for the email
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern);
      if (regex.hasMatch(email)) {
        if (password.length >= 6) {
          signinWithEmailAndPassword(email, password, context);
        } else {
          //To handle insuffiicient password length
          Fluttertoast.showToast(
              msg: "Password length should be more than 6 characters!");
        }
      } else {
        //To handle the incorrect email format
        Fluttertoast.showToast(msg: "Please enter a valid email address!");
      }
    } else {
      //Handling the error if fields are empty
      Fluttertoast.showToast(msg: "Please fill all the fields!");
    }
  }

  void signinWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    //Creating account using inbuilt function
    try {
      await authLogIn.signInWithEmailAndPassword(
          email: email, password: password);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    } catch (e) {
      //Handle Exceptions
      print(e);
      Fluttertoast.showToast(msg: "Incorrect Password!");
    }
  }
}
