import 'package:authentication_app/UI/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupInputs extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
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
            decoration: InputDecoration(
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
              labelText: "Enter the Fullname:",
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
          TextField(
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
                horizontal: 30.0,
                vertical: 30.0,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 20.0,
              ),
            ),
          ),
      ],),
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,
      ),
    );
  }
}