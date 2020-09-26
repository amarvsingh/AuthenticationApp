import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Model/time_slots.dart';

class TimeSlotPickerMatrix extends StatefulWidget {
  TimeSlotPickerMatrix({Key key}) : super(key: key);

  @override
  TimeSlotPickerMatrixState createState() => TimeSlotPickerMatrixState();
}

class TimeSlotPickerMatrixState extends State<TimeSlotPickerMatrix> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height / 3.5,
      margin: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.deepOrangeAccent, width: 1),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              TimeSlots('00:00'),
              TimeSlots('01:00'),
              TimeSlots('02:00'),
              TimeSlots('03:00'),
              TimeSlots('04:00'),
              TimeSlots('05:00'),
            ],
          ),
          Row(
            children: <Widget>[
              TimeSlots('06:00'),
              TimeSlots('07:00'),
              TimeSlots('08:00'),
              TimeSlots('09:00'),
              TimeSlots('10:00'),
              TimeSlots('11:00'),
            ],
          ),
          Row(
            children: <Widget>[
              TimeSlots('12:00'),
              TimeSlots('13:00'),
              TimeSlots('14:00'),
              TimeSlots('15:00'),
              TimeSlots('16:00'),
              TimeSlots('17:00'),
            ],
          ),
          Row(
            children: <Widget>[
              TimeSlots('18:00'),
              TimeSlots('19:00'),
              TimeSlots('20:00'),
              TimeSlots('21:00'),
              TimeSlots('22:00'),
              TimeSlots('23:00'),
            ],
          ),
        ],
      ),
    );
  }
}
