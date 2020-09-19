import 'package:flutter/material.dart';

class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login",
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
                  GestureDetector(
                    onTap: (){

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
            ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 20.0,
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