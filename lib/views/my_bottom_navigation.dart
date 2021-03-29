import 'package:flutter/material.dart';

import 'package:flutter_health_tracker/views/goals.dart';
import 'package:flutter_health_tracker/views/history.dart';
import 'package:flutter_health_tracker/views/home.dart';
import 'package:flutter_health_tracker/views/settings.dart';
import 'package:flutter_health_tracker/widgets/custom_widget.dart';

class NyBottomNavigation extends StatefulWidget {
  NyBottomNavigation({Key key}) : super(key: key);

  @override
  _NyBottomNavigationState createState() => _NyBottomNavigationState();
}

class _NyBottomNavigationState extends State<NyBottomNavigation>
    with TickerProviderStateMixin {
  int _bottomNavIndex = 0;

  void _onItemTapped(int index) {
    if (index != 3) {
      setState(() {
        _bottomNavIndex = index;
      });

      print(_bottomNavIndex);
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Settings()),
      );
    }
  }

  Widget pageCaller(int index) {
    switch (index) {
      case 0:
        {
          return Home();
        }
      case 1:
        {
          return Goals();
        }
      case 2:
        {
          return History();
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pageCaller(_bottomNavIndex),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        elevation: 0,
        highlightElevation: 0,
        backgroundColor: Color(0xFF4051E7),
        onPressed: () {
          newMeasureaddmodalbottomsheet(context);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: FABBottomAppBar(
        // centerItemText: 'ADD',
        color: Colors.grey,
        selectedColor: Color(0xFF4051E7),
        notchedShape: CircularNotchedRectangle(),

        onTabSelected: _onItemTapped,
        items: [
          FABBottomAppBarItem(iconData: Icons.home_outlined, text: ''),
          FABBottomAppBarItem(
              iconData: Icons.filter_tilt_shift_outlined, text: ''),
          FABBottomAppBarItem(iconData: Icons.history, text: ''),
          FABBottomAppBarItem(iconData: Icons.settings, text: ''),
        ],
      ),
    );
  }
}

class FABBottomAppBarItem {
  FABBottomAppBarItem({this.iconData, this.text});
  IconData iconData;
  String text;
}

class FABBottomAppBar extends StatefulWidget {
  FABBottomAppBar({
    this.items,
    this.centerItemText,
    this.height: 60.0,
    this.iconSize: 24.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
  }) {
    assert(this.items.length == 2 || this.items.length == 4);
  }
  final List<FABBottomAppBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      shape: widget.notchedShape,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: widget.backgroundColor,
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
            Text(
              widget.centerItemText ?? '',
              style: TextStyle(color: widget.color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    FABBottomAppBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.iconData, color: color, size: widget.iconSize),
                Text(
                  item.text,
                  style: TextStyle(color: color),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
