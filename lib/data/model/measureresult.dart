import 'package:flutter/cupertino.dart';
import 'package:flutter_health_tracker/data/model/newmeasure.dart';

class MeasureResult {
  NewMeasure measuredata;
  String goalName;
  Color color;
  String unit;
  String date;
  int quantity;
  String isradial;
  MeasureResult({
    this.measuredata,
    this.goalName,
    this.color,
    this.unit,
    this.date,
    this.quantity,
    this.isradial,
  });
}
