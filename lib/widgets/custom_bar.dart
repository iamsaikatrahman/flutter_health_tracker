import 'package:flutter/material.dart';

class CustomBar extends StatelessWidget {
  const CustomBar({
    Key key,
    @required this.progressColor,
    @required this.bgColor,
    @required this.progresspercent,
  }) : super(key: key);
  final Color progressColor, bgColor;
  final int progresspercent;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double maxBarWidth = constraints.maxWidth;
        final double percent = (progresspercent - 100) / progresspercent;
        double barWidth = percent * maxBarWidth;

        if (barWidth < 0) {
          barWidth = 0;
        }
        return Stack(
          children: <Widget>[
            Container(
              height: 5.0,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            Container(
              height: 5.0,
              width: barWidth,
              decoration: BoxDecoration(
                color: progressColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ],
        );
      },
    );
  }
}
