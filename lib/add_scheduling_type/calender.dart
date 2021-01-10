import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

class CalenderScreen extends StatefulWidget {
  @override
  _CalenderScreenState createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  CalendarController _calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: TableCalendar(
                headerVisible: false,
            calendarStyle: CalendarStyle(
              highlightSelected: true,
              selectedColor: Colors.grey,
              todayColor: Colors.black,
              markersColor: Colors.black,
              outsideDaysVisible: false,
            ),
            calendarController: _calendarController,
          ),
        ),
      ),
    );
  }
}
