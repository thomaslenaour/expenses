import 'package:flutter/material.dart';

class GoalsModel extends ChangeNotifier {
  static String title;
  static double progression;


  String get getTitle => title;
  double get getProgression => progression;

  set changeTitle(String newTitle) {
    title = newTitle;
  }

  set updateProgression(double newProgression) {
    progression = newProgression;
  }

}
