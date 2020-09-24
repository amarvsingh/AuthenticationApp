import 'package:authentication_app/UI/dashboard.dart';
import 'package:authentication_app/UI/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_slot_picker/time_slot_picker.dart';
import 'package:intl/intl.dart';

class ManageSchedule extends StatefulWidget {
  ManageSchedule({Key key}) : super(key: key);

  @override
  _ManageScheduleState createState() => _ManageScheduleState();
}

class _ManageScheduleState extends State<ManageSchedule> {
  DateTime pickedDate;
  DateTime startTime;
  DateTime endTime;
  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    startTime = null;
    endTime = null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Manage Schedule",
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.orangeAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Material(
        child: Container(
          child: SafeArea(
              child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 20),
                  child: Text("Prepare your schedule...",
                      style: GoogleFonts.aBeeZee(
                        textStyle:
                            TextStyle(color: Colors.deepOrange, fontSize: 30),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    _pickDate();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(color: Colors.deepOrange)),
                      child: ListTile(
                        title: Text(
                          "Date : ${pickedDate.day}/${pickedDate.month}/${pickedDate.year}",
                          style: GoogleFonts.aBeeZee(
                              textStyle: TextStyle(
                                  color: Colors.deepOrangeAccent,
                                  fontSize: 20)),
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: TimeSlotPicker(
                      slotBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      textStyle: TextStyle(color: Colors.deepOrange),
                      onTap: (startTime, endTime) {
                        // (Required)
                        Fluttertoast.showToast(
                            msg: DateFormat("H:m:s")
                                    .format(startTime)
                                    .toString() +
                                " >> " +
                                DateFormat("H:m:s").format(endTime).toString());
                        // print(
                        //     startTime.toString() + " >> " + endTime.toString()); //Console print
                      }),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: pickedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 1));

    if (date != null)
      setState(() {
        pickedDate = date;
      });
  }
}
