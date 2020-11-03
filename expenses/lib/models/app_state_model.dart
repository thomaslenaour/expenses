import 'package:flutter/foundation.dart' as foundation;
import 'expense.dart';
import 'expense_model.dart';

class AppStateModel extends foundation.ChangeNotifier {
  List<Expense> _allExpenses;
  ExpCategory _selectedCategory = ExpCategory.Toutes;

  ExpCategory get selectedCategory {
    return _selectedCategory;
  }

  List<Expense> getExpenses() {
    if (_allExpenses == null) {
      return [];
    }
    return List.from(_allExpenses);
  }

  List<Expense> getReversedExpenses() {
    if (_allExpenses == null) {
      return [];
    }
    return List.from(_allExpenses.reversed);

  }

  List<Expense> getLatestExpenses() {
    if (_allExpenses == null) {
      return [];
    }

    List<Expense> reversedExpenses = List.from(_allExpenses.reversed);
    List<Expense> latestExpenses = [];

    for(var index = 0; index < 4; index++){
      if(index >= reversedExpenses.length){
        break;
      }
      latestExpenses.add(reversedExpenses[index]);
      }

      return latestExpenses;
  }

  List<double> getAllAmounts() {
    if(_allExpenses.length > 0){
      List<double> allAmounts = [];

      for(var index = 0; index < _allExpenses.length ; index++){
        allAmounts.add(_allExpenses[index].amount);
      }

      return allAmounts;
    } else {
      return [];
    }
  }

  // Search an expense
  List<Expense> search(String searchTerms) {
    return getExpenses().where((expense) {
      return expense.name.toLowerCase().contains(searchTerms.toLowerCase());
    }).toList();
  }

  Expense getExpenseById(int id) {
    return _allExpenses.firstWhere((exp) => exp.id == id);
  }

  // Loads the list of expenses from the model.
  void loadExpenses() {
    _allExpenses = ExpenseModel.loadExpenses();
    notifyListeners();
  }

  void setCategory(ExpCategory newCategory) {
    _selectedCategory = newCategory;
    notifyListeners();
  }

  void setExpenses(Expense newExpense) {
    _allExpenses.add(newExpense);
    notifyListeners();
  }
  
}
