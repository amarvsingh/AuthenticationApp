import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardFirst extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          child: Icon(
            Icons.add,
            size: 50.0,
            color: Colors.white,
          ),
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(50),
          ),

        ),
      ),
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 20.0,
      ),
      decoration: BoxDecoration(gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepOrangeAccent,
            Colors.redAccent,
            Colors.red,
          ]
      ),),
    );
  }

  //To logout from the application
  void logOut(BuildContext context) async {
    final FirebaseAuth authLogOut = FirebaseAuth.instance;
    await authLogOut.signOut();
    print(context);
    Fluttertoast.showToast(msg: "Context: ${context}");
    Navigator.pop(context);
  }
}