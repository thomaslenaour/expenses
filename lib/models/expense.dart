import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ExpenseModel extends ChangeNotifier {
  List<Expense> expenseList = [
    Expense(name: "à bordeaux",
            description: "Courses", 
            price: 33.4, 
            urlLogo: 'https://logo.clearbit.com/geantcasino.fr') 
  ];

  List<Expense> get getExpenses => expenseList;

  double getTotalExpensesAmount() {
    double totalAmount;
    for (var index = 0; index < expenseList.length; index++) {
      totalAmount += expenseList[index].getPrice;
    }

    return totalAmount;
  }

  addExpense(Expense expense) {
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

  Expense({this.name, this.description, this.price, this.urlLogo});

  String get getUrlLogo => urlLogo;
  String get getDescription => description;
  double get getPrice => price;
}
