import 'package:flutter/material.dart';
import 'package:flutter_health_tracker/views/goals.dart';
import 'package:flutter_health_tracker/views/home.dart';
import 'package:flutter_health_tracker/views/settings.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (tabItem == "Page1")
      child = Home();
    else if (tabItem == "Page2")
      child = Goals();
    else if (tabItem == "Page3") child = Settings();

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
