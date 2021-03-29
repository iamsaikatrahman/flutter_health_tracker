import 'package:flutter/material.dart';
import 'package:flutter_health_tracker/data/data.dart';
import 'package:flutter_health_tracker/widgets/custom_bar.dart';
import 'package:flutter_health_tracker/widgets/radial_painter.dart';

Text headerTitle(String title) {
  return Text(
    title,
    style: TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.5,
    ),
  );
}

Container customDivider(Color color) {
  return Container(
    height: 2,
    width: double.infinity,
    color: color,
  );
}

Future newMeasureaddmodalbottomsheet(BuildContext context) {
  return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                height: 360,
                width: double.infinity,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: measurelist.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print(measurelist[index].name);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.all(10),
                        elevation: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: measurelist[index].color.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color:
                                      measurelist[index].color.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Icon(
                                  measurelist[index].icon,
                                  size: 30,
                                  color: measurelist[index].color,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                measurelist[index].name,
                                style: TextStyle(
                                  letterSpacing: .5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      });
}

GridView homeGridviewCard() {
  return GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: measure.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.65,
    ),
    itemBuilder: (context, index) {
      return Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: measure[index].measuredata.color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        measure[index].measuredata.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(measure[index].date),
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: measure[index].measuredata.color.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Icon(
                      measure[index].measuredata.icon,
                      color: measure[index].measuredata.color,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              (measure[index].isradial == "true")
                  ? Container(
                      height: 120,
                      width: 120,
                      child: CustomPaint(
                        foregroundPainter: RadialPainter(
                          bgcolor:
                              measure[index].measuredata.color.withOpacity(0.2),
                          lineColor: measure[index].measuredata.color,
                          percent: measure[index].quantity * 10 / 100,
                          width: 4.0,
                        ),
                        child: Center(
                          child: Text(
                            '${measure[index].quantity}' + measure[index].unit,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(
                      height: 120,
                      width: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int i = 2; i <= 7; i += 2)
                            Container(
                              height: i * 10.toDouble(),
                              width: 5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: measure[index]
                                    .measuredata
                                    .color
                                    .withOpacity(0.4),
                              ),
                            ),
                          for (int i = 5; i > 1; i -= 3)
                            Container(
                              height: i * 10.toDouble(),
                              width: 5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: measure[index]
                                    .measuredata
                                    .color
                                    .withOpacity(0.5),
                              ),
                            ),
                          for (int i = 4; i >= 1; i -= 2)
                            Container(
                              height: i * 10.toDouble(),
                              width: 5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: measure[index]
                                    .measuredata
                                    .color
                                    .withOpacity(0.4),
                              ),
                            ),
                        ],
                      ),
                    ),
              (measure[index].isradial != "true")
                  ? Text(
                      '${measure[index].quantity} ' + measure[index].unit,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      );
    },
  );
}

ListView goalListCard() {
  return ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: measure.length,
    itemBuilder: (context, index) {
      return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey,
              offset: Offset(1, 3),
              blurRadius: 6,
              spreadRadius: -3,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: measure[index].measuredata.color.withOpacity(0.3),
                  ),
                  child: Icon(measure[index].measuredata.icon,
                      color: measure[index].measuredata.color),
                ),
                SizedBox(width: 10),
                Text(
                  measure[index].goalName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            CustomBar(
                progressColor:
                    measure[index].measuredata.color.withOpacity(0.3),
                bgColor: Colors.blueGrey[50],
                progresspercent: 230),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${measure[index].quantity}' +
                      '/' +
                      '${measure[index].quantity}' +
                      measure[index].unit,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${measure[index].quantity / 100}' + '%',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 1; i <= 3; i++)
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80"),
                            )),
                      ),
                    Text("+ 3")
                  ],
                )),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text("Friends Participates"),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

ListView historyListTileCard() {
  return ListView.separated(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: measure.length,
    separatorBuilder: (context, index) {
      return customDivider(Colors.blueGrey[50]);
    },
    itemBuilder: (context, index) {
      return ListTile(
        leading: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: measure[index].measuredata.color.withOpacity(0.3),
          ),
          child: Icon(
            measure[index].measuredata.icon,
            color: measure[index].measuredata.color,
          ),
        ),
        title: Text(measure[index].measuredata.name),
        subtitle: Text('${measure[index].quantity}' + measure[index].unit),
        trailing: Text(measure[index].date),
      );
    },
  );
}
