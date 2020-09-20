import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupInputs extends StatelessWidget{
  //Declaring Database references
  final FirebaseAuth authSignUp = FirebaseAuth.instance;

  //The variables required to save the inputs
  String fullname = "";
  String email = "";
  String password = "";
  String confirmPassword = "";

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Container(
          child: Text(
            "Enter the Details",
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
            onChanged: (fullnameInput){
              fullname = fullnameInput;
            },
            decoration: InputDecoration(
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
              labelText: "Enter Fullname:",
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
            onChanged: (emailInput){
              email = emailInput;
            },
            decoration: InputDecoration(
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
              labelText: "Enter Email:",
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
            onChanged: (passwordInput){
              password = passwordInput;
            },
            decoration: InputDecoration(
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
              labelText: "Enter Password:",
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
          TextField(
            onChanged: (confirmPasswordInput){
              confirmPassword = confirmPasswordInput;
            },
            decoration: InputDecoration(
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
              labelText: "Confirm Password:",
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
          GestureDetector(
            onTap: (){
              validateAndSignup(fullname, email, password, confirmPassword);
            },
            child: Container(
              child: Text(
                "SIGN UP!",
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
                horizontal: 20.0,
                vertical: 30.0,
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
        vertical: 10.0,
        horizontal: 30.0,
      ),
    );
  }

  //Method to validate the function (Nested Validation)
  void validateAndSignup(String fullname, String email, String password, String confirmPassword) {
    //Handling the inputs
    if (fullname.isNotEmpty && email.isNotEmpty && password.isNotEmpty && confirmPassword.isNotEmpty){//To check that no field is empty
      //Pattern matching for the email
      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern);
      if (regex.hasMatch(email)){
        if (password == confirmPassword){
          signUpWithEmailandPassword(fullname, email, password, confirmPassword);
        }
        else{
          //Handle error for non matching passwords
          Fluttertoast.showToast(msg: "The passwords you have entered do not match!");
        }
      }
      else{
        //Handle error for incorrect email format
        Fluttertoast.showToast(msg: "Please enter a valid email address!");
      }
    }
    else{
      //Handle error if any field is empty
      Fluttertoast.showToast(msg: "Please fill all the fields!");
    }
  }

  //Method to Create account and add user data into the databse as well
  void signUpWithEmailandPassword(String fullname, String email, String password, String confirmPassword) async {
    //Declaring Database references
    FirebaseUser userSignUp;

    //Creating account using inbuilt function
    try{
      userSignUp = (await authSignUp.createUserWithEmailAndPassword(email: email, password: password)) as FirebaseUser;
    }
    catch(e){
      //Handle Exceptions
      Fluttertoast.showToast(msg: "Some unknown error occoured!");
    }
  }
}