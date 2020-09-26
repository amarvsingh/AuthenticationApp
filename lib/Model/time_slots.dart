import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeSlots extends StatefulWidget {
  final String time;
  TimeSlots(this.time);

  @override
  _TimeSlotsState createState() => _TimeSlotsState();
}

class _TimeSlotsState extends State<TimeSlots> {
  bool pressed = false;
  int counter = 1;

  @override
  void initState() {
    super.initState();
    pressed;
    counter;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flexible(
        child: Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: FlatButton(
            child: Text(
              "${widget.time}",
              style: GoogleFonts.sourceSansPro(
                  textStyle: TextStyle(
                      color: pressed ? Colors.white : Colors.deepOrangeAccent)),
              overflow: TextOverflow.clip,
            ),
            onHighlightChanged: (value) => {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            onPressed: () {
              setState(() {
                pressed = true;
                counter = counter + 1;
              });
              if (counter % 2 != 0) {
                setState(() {
                  pressed = false;
                });
              }
            },
            color: pressed ? Colors.deepOrange : Colors.white,
          ),
        ),
      ),
    );
  }
}
