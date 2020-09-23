import 'package:authentication_app/UI/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'logout.dart';

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
              validateAndSignup(fullname, email, password, confirmPassword, context);
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
  void validateAndSignup(String fullname, String email, String password, String confirmPassword, BuildContext context) {
    //Handling the inputs
    if (fullname.isNotEmpty && email.isNotEmpty && password.isNotEmpty && confirmPassword.isNotEmpty){//To check that no field is empty
      //Pattern matching for the email
      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern);
      if (regex.hasMatch(email)){
        if (password == confirmPassword){
          signUpWithEmailandPassword(fullname, email, password, confirmPassword, context);
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
  void signUpWithEmailandPassword(String fullname, String email, String password, String confirmPassword, BuildContext context) async {
    //Creating account using inbuilt function
    try{
      await authSignUp.createUserWithEmailAndPassword(email: email, password: password);
      //To add the User information to the databse and then navigate
      addDataToDatabase(fullname, email, context);
    }
    catch(e){
      //Handle Exceptions
      Fluttertoast.showToast(msg: "Email Address you have entered already exists!");
    }
  }

  void addDataToDatabase(String fullname, String email, BuildContext context) {
    try{
      //Declaring Database references
      FirebaseDatabase databaseSignUp = new FirebaseDatabase();
      DatabaseReference referenceSignUp = databaseSignUp.reference().child("users");
      //To get the UID of the newly added user
      final User userSignUp = authSignUp.currentUser;
      final String uid = userSignUp.uid.toString();
      //To add the inputs into the database
      referenceSignUp.child(uid).set({
        "name" : fullname,
        "email" : email
      });
      Fluttertoast.showToast(msg: "Account created Successfully");
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Dashboard())
      );
    }
    catch(e){
      //To handle errors
      Fluttertoast.showToast(msg: "Some unknown error has occured!");
    }
  }
}