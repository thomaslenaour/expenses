import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ExpenseModel extends ChangeNotifier {
  List<Expense> expenseList = [
    Expense(
      'Courses',
      'à Bordeaux',
      33.4,
    ),
    Expense(
      'Macbook',
      'à Bordeaux',
      2000,
    ),
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

  Expense(this.name, this.description, this.price);
}
