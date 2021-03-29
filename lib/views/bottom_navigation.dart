import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_health_tracker/views/settings.dart';
import 'package:flutter_health_tracker/widgets/tabnavigator.dart';

class HealthTrackerBottomNavigationBar extends StatefulWidget {
  @override
  _HealthTrackerBottomNavigationBarState createState() =>
      _HealthTrackerBottomNavigationBarState();
}

class _HealthTrackerBottomNavigationBarState
    extends State<HealthTrackerBottomNavigationBar> {
  // bool _debugLocked = false;
  String _currentPage = "Page1";
  List<String> pageKeys = ["Page1", "Page2", "Page3"];
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Page1": GlobalKey<NavigatorState>(),
    "Page2": GlobalKey<NavigatorState>(),
    "Page3": GlobalKey<NavigatorState>(),
  };
  int _selectedIndex = 0;
  void _selectTab(String tabItem, int index) {
    if (tabItem == _currentPage) {
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    }
    // if (_selectedIndex == 2) {
    //   setState(() {
    //     Navigator.push(context, MaterialPageRoute(builder: (_) => Settings()));
    //     _selectedIndex = index;
    //   });
    // }

    else {
      setState(() {
        _currentPage = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentPage].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != "Page1") {
            _selectTab("Page1", 1);

            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator("Page1"),
          _buildOffstageNavigator("Page2"),
          _buildOffstageNavigator("Page3"),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blueAccent,
          onTap: (int index) {
            _selectTab(pageKeys[index], index);
          },
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.looks_one),
              title: new Text('Page1'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.looks_two),
              title: new Text('Page2'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.looks_3),
              title: new Text('Page3'),
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
