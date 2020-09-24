import 'package:authentication_app/Model/dashboard_first.dart';
import 'package:authentication_app/Model/dashboard_second.dart';
import 'package:authentication_app/Model/dashboard_third.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import './manage_schedule.dart';

class Dashboard extends StatefulWidget {
  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          PopupOptionMenu(),
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: <Tab>[
            new Tab(
              child: Text(
                "Upcoming",
                style: TextStyle(
                  color: Colors.black,
                  // fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            new Tab(
              child: Text(
                "Requested",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ),
            new Tab(
              child: Text(
                "Your profile",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
      body: new TabBarView(
        controller: tabController,
        children: <Widget>[
          new DashboardFirst(),
          new DashboardSecond(),
          new DashboardThird(),
        ],
      ),
    );
  }
}

//Menu facilitator
enum MenuOption { logout, settings, feedback, manage_schedule }

// Class to build the menu
class PopupOptionMenu extends StatelessWidget {
  const PopupOptionMenu({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PopupMenuButton<MenuOption>(
      icon: Icon(
        Icons.menu,
        color: Colors.red,
      ),
      itemBuilder: (BuildContext context1) {
        return <PopupMenuEntry<MenuOption>>[
          PopupMenuItem(
            child: Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.calendar_today,
                    color: Colors.red,
                  ),
                  padding: EdgeInsets.all(5),
                ),
                Container(
                  child: Text(
                    "Manage Schedule",
                    style: TextStyle(color: Colors.black),
                  ),
                  padding: EdgeInsets.all(5),
                )
              ],
            ),
            value: MenuOption.manage_schedule,
          ),
          PopupMenuItem(
            child: Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.settings,
                    color: Colors.red,
                  ),
                  padding: EdgeInsets.all(5),
                ),
                Container(
                  child: Text(
                    "Settings",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  padding: EdgeInsets.all(5),
                ),
              ],
            ),
            value: MenuOption.settings,
          ),
          PopupMenuItem(
            child: Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.feedback,
                    color: Colors.red,
                  ),
                  padding: EdgeInsets.all(5),
                ),
                Container(
                  child: Text(
                    "Feedback",
                    style: TextStyle(color: Colors.black),
                  ),
                  padding: EdgeInsets.all(5),
                ),
              ],
            ),
            value: MenuOption.feedback,
          ),
          PopupMenuItem(
            child: Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                  ),
                  padding: EdgeInsets.all(5),
                ),
                Container(
                  child: Text(
                    "Logout!",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  padding: EdgeInsets.all(5),
                ),
              ],
            ),
            value: MenuOption.logout,
          ),
        ];
      },
      onSelected: (selection) {
        if (selection == MenuOption.logout) {
          logOut(context);
        }
        if (selection == MenuOption.manage_schedule) {
          manageSchedule(context);
        }
      },
    );
  }

  void logOut(BuildContext context) async {
    final FirebaseAuth authLogOut = FirebaseAuth.instance;
    await authLogOut.signOut();
    print(context);
    Fluttertoast.showToast(msg: "Context: $context");
    Navigator.pop(context);
  }
}

void manageSchedule(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => ManageSchedule()));
}
