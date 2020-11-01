import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:expenses/models/category.dart';


class ExpenseModel extends ChangeNotifier {
  List<Expense> expenseList = [
    Expense(
        name: "Apple Store",
        description: "Achat Mac",
        price: 3000,
        urlLogo: 'https://logo.clearbit.com/apple.fr',
        category: Category(title: "Shopping", color: "#db404f"),
        )
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
  Category category;

  Expense(
      {this.name, this.description, this.price, this.urlLogo, this.category});

  String get getUrlLogo => urlLogo;
  String get getDescription => description;
  double get getPrice => price;
}
