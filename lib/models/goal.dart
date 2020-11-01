import 'package:charts_flutter/flutter.dart';
import 'package:expenses/models/category.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class GoalModel extends ChangeNotifier {
  List<Goal> goalList = [Goal(title: "Course", progression: 83)];
  List<Goal> get getGoals => goalList;
}

class Goal {
  Uuid id = Uuid();
  String title;
  double progression;
  double maxAmount;
  DateTime startDate;
  DateTime endDate;
  Category category;

  Goal({
      this.title,
      this.progression,
      this.maxAmount,
      this.startDate,
      this.endDate,
      this.category
      });

  String get getTitle => title;
  double get getProgression => progression;

  set changeTitle(String newTitle) {
    title = newTitle;
  }

  set updateProgression(double newProgression) {
    progression = newProgression;
  }
}
