import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomTableCalendar extends StatelessWidget {
  const CustomTableCalendar({
    Key key,
    @required CalendarController calendarController,
  })  : _calendarController = calendarController,
        super(key: key);

  final CalendarController _calendarController;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      initialCalendarFormat: CalendarFormat.week,
      calendarController: _calendarController,
      calendarStyle: CalendarStyle(
        weekdayStyle: TextStyle(
          color: Colors.white,
        ),
        weekendStyle: TextStyle(
          color: Colors.white,
        ),
        todayStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(
          color: Colors.white,
        ),
        weekendStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        leftChevronVisible: false,
        rightChevronVisible: false,
        headerPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, events) => Container(
          margin: EdgeInsets.all(4),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFF1727B5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            date.day.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        todayDayBuilder: (context, date, events) => Container(
          margin: EdgeInsets.all(4),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFF1727B5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            date.day.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
