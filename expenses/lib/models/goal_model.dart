import 'expense.dart';
import 'goal.dart';

class GoalModel {
  static var _allGoals = <Goal>[
    Goal(
      category: ExpCategory.Alimentation,
      id: 0,
      name: 'Objectif Alimentation',
      maxAmount: 300),
    Goal(
      category: ExpCategory.Sorties,
      id: 1,
      name: 'Objectif Sorties',
      maxAmount: 300),
    Goal(
      category: ExpCategory.Sports,
      id: 2,
      name: 'Objectif Sports',
      maxAmount: 300),
    Goal(
      category: ExpCategory.Famille,
      id: 3,
      name: 'Objectif Famille',
      maxAmount: 300),
  ];

  static List<Goal> loadGoals() {
    return _allGoals;
  }
}
