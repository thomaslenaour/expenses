import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ExpenseModel extends ChangeNotifier {
  List<Expense> expenseList = [
    Expense(
      'Courses',
      'à Bordeaux',
      33.4,
      'https://logo.clearbit.com/geantcasino.fr'
    ),
    Expense(
      'Macbook',
      'à Bordeaux',
      2000,
      'https://logo.clearbit.com/apple.com'
    ),
    Expense(
        'Courses',
        'à Bordeaux',
        33.4,
        'https://logo.clearbit.com/geantcasino.fr'
    ),
    Expense(
        'Macbook',
        'à Bordeaux',
        2000,
        'https://logo.clearbit.com/apple.com'
    ),
    Expense(
        'Courses',
        'à Bordeaux',
        33.4,
        'https://logo.clearbit.com/geantcasino.fr'
    ),
    Expense(
        'Macbook',
        'à Bordeaux',
        2000,
        'https://logo.clearbit.com/apple.com'
    )
  ];

  List<Expense> get getExpenses => expenseList;

  set addExpense(Expense expense) {
    expenseList.add(expense);
    notifyListeners();
  }
}

class Expense {
  Uuid id = Uuid();
  String name;
  String description;
  double price; // €
  String urlLogo;

  Expense(this.name, this.description, this.price, this.urlLogo);

  String get getUrlLogo => urlLogo;
  String get getDescription => description;
}
