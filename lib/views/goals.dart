import 'package:flutter/material.dart';
import 'package:flutter_health_tracker/widgets/custom_widget.dart';

class Goals extends StatefulWidget {
  @override
  _GoalsState createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF4051E7),
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: FlatButton(
                        onPressed: () {
                          newMeasureaddmodalbottomsheet(context);
                        },
                        child: Text(
                          "Add new",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: headerTitle("Goals")),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40),
                          ),
                        ),
                        child: DefaultTabController(
                          length: 2,
                          initialIndex: 0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Column(
                              children: [
                                SizedBox(height: 30),
                                Stack(
                                  children: [
                                    Container(
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFECEEFD),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    Container(
                                      child: TabBar(
                                        labelColor: Colors.white,
                                        labelStyle: TextStyle(
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        unselectedLabelColor: Color(0xFF4051E7),
                                        indicator: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: Color(0xFF4051E7),
                                        ),
                                        tabs: [
                                          Tab(text: 'Ongoing'),
                                          Tab(text: "Completed"),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.59,
                                  child: TabBarView(
                                    children: [
                                      SingleChildScrollView(
                                        child: Container(
                                          child: goalListCard(),
                                        ),
                                      ),
                                      SingleChildScrollView(
                                        child: Container(
                                          child: goalListCard(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
