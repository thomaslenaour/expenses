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
        ),
    Expense(
        name: "Hard Rock Café",
        description: "Bière avec les potes",
        price: 17.50,
        urlLogo: 'https://logo.clearbit.com/hardrockcafe.com',
        category: Category(title: "Sorties", color: "#6d70d1"),
    ),
    Expense(
      name: "Courses",
      description: "Courses pour le soir",
      price: 47.93,
      urlLogo: 'https://logo.clearbit.com/carrefour.com',
      category: Category(title: "Alimentation", color: "#6d93d1"),
    ),
    Expense(
      name: "Nike Store",
      description: "Air Jordan One",
      price: 17.50,
      urlLogo: 'https://logo.clearbit.com/nike.com',
      category: Category(title: "Shopping", color: "#6d70d1"),
    ),
  ];

  List<Expense> get getExpenses => expenseList;

  List<Expense> getLatestExpenses(){
    List<Expense> latestExpenses = [];
    for(var index = expenseList.length - 1; index > expenseList.length - 4; index--){
      latestExpenses.add(expenseList[index]);
    }

    return latestExpenses;
  }

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
  String description = "Aucune description";
  double price; // €
  String urlLogo;
  Category category;

  Expense(
      {this.name, this.description, this.price, this.urlLogo, this.category});

  String get getUrlLogo => urlLogo;
  String get getDescription => description;
  double get getPrice => price;
}
