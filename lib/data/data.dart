import 'package:flutter/material.dart';
import 'package:flutter_health_tracker/data/model/measureresult.dart';
import 'package:flutter_health_tracker/data/model/newmeasure.dart';
//new measure data

//1
final heartrate = NewMeasure(
  name: "Heart rate",
  color: Colors.pink,
  icon: Icons.favorite_border_outlined,
);
//2
final meditation = NewMeasure(
  name: "Meditation",
  color: Color(0xFF4050E7),
  icon: Icons.settings_input_antenna,
);
//3
final sleep = NewMeasure(
  name: "Sleep",
  color: Color(0xFFB991EB),
  icon: Icons.nights_stay_outlined,
);
//4
final water = NewMeasure(
  name: "Water",
  color: Colors.green,
  icon: Icons.invert_colors,
);
//5
final steps = NewMeasure(
  name: "Steps",
  color: Colors.lightBlue,
  icon: Icons.directions_run,
);
//6
final temperature = NewMeasure(
  name: "Temperature",
  color: Colors.red,
  icon: Icons.thermostat_outlined,
);
//7
final weight = NewMeasure(
  name: "Weight",
  color: Colors.cyan,
  icon: Icons.pregnant_woman,
);

final List<NewMeasure> measurelist = [
  heartrate,
  meditation,
  sleep,
  water,
  steps,
  temperature,
  weight,
];

//heartrate
final heartrateMeasure = MeasureResult(
  goalName: "Heart Rate",
  measuredata: heartrate,
  date: "Today 12:33",
  quantity: 82,
  unit: "bpm",
  isradial: "false",
);
//sleep
final sleepMeasure = MeasureResult(
  goalName: "8 hr a day",
  measuredata: sleep,
  date: "Today 12:45",
  quantity: 6,
  unit: "hr",
  isradial: "true",
);
//meditation
final meditationMeasure = MeasureResult(
  goalName: "30 min a day",
  measuredata: meditation,
  date: "Today 01:30",
  quantity: 15,
  unit: "min",
  isradial: "false",
);
//water
final waterMeasure = MeasureResult(
  goalName: "Drink Water",
  measuredata: water,
  date: "Today 12:45",
  quantity: 1200,
  unit: "ml",
  isradial: "false",
);
//steps
final stepsMeasure = MeasureResult(
  goalName: "12,000 steps a day",
  measuredata: steps,
  date: "Today 12:45",
  quantity: 1100,
  unit: "steps",
  isradial: "false",
);

//weight
final weightMeasure = MeasureResult(
  goalName: "Lose Weight",
  measuredata: weight,
  date: "Today 12:45",
  quantity: 5,
  unit: "kg",
  isradial: "true",
);
//temperature
final temperatureMeasure = MeasureResult(
  goalName: "Temperature",
  measuredata: temperature,
  date: "Today 12:45",
  quantity: 5,
  unit: "°",
  isradial: "true",
);

final List<MeasureResult> measure = [
  heartrateMeasure,
  meditationMeasure,
  waterMeasure,
  temperatureMeasure,
  weightMeasure,
  sleepMeasure,
  stepsMeasure,
];
