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
        'Air Force One',
        'à Bordeaux',
        99.99,
        'https://logo.clearbit.com/nike.com'
    ),
    Expense(
        'Abonnement Spotify',
        'à Bordeaux',
        4.99,
        'https://logo.clearbit.com/spotify.com'
    ),
  ];

  List<Expense> get getExpenses => expenseList;

  double getTotalExpensesAmount(){
    double totalAmount;
    for(var index = 0; index < expenseList.length; index++){
      totalAmount += expenseList[index].getPrice;
    }

    return totalAmount;
  }

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
  double get getPrice => price;
}
