import 'package:flutter/material.dart';
import 'package:flutter_health_tracker/widgets/custom_bar.dart';
import 'package:flutter_health_tracker/widgets/custom_tablecalendar.dart';
import 'package:flutter_health_tracker/widgets/custom_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CalendarController _calendarController;
  @override
  void initState() {
    _calendarController = CalendarController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF4051E7),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14.0, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          headerTitle("Hi, Mary"),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFF64D0FF),
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "https://images.unsplash.com/photo-1528228377194-2faca82540e4?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomTableCalendar(
                      calendarController: _calendarController,
                    ),
                    SizedBox(height: 2),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: CustomBar(
                        progressColor: Color(0xFF84E0B4),
                        bgColor: Color(0xFF7984EE),
                        progresspercent: 500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 4),
                      child: Text(
                        "8 of 10 Completed",
                        style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(top: 30),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  child: homeGridviewCard(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
