import 'package:flutter/foundation.dart' as foundation;
import 'expense.dart';
import 'expense_model.dart';

class AppStateModel extends foundation.ChangeNotifier {
  List<Expense> _allExpenses;
  Category _selectedCategory = Category.Toutes;

  Category get selectedCategory {
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
    if (_selectedCategory == Category.Toutes) {
      return List.from(_allExpenses.reversed);
    } else {
      return _allExpenses.where((exp) {
        return exp.category == _selectedCategory;
      }).toList();
    }
  }

  List<Expense> getLatestExpenses() {
    if (_allExpenses == null) {
      return [];
    }

    if (_selectedCategory == Category.Toutes) {

      List<Expense> reversedExpenses = List.from(_allExpenses.reversed);
      List<Expense> latestExpenses = [];

      for(var index = 0; index < 3; index++){
        if(index >= reversedExpenses.length){
          break;
        }
        latestExpenses.add(reversedExpenses[index]);
      }

      return latestExpenses;
    } else {
      return _allExpenses.where((exp) {
        return exp.category == _selectedCategory;
      }).toList();
    }
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

  void setCategory(Category newCategory) {
    _selectedCategory = newCategory;
    notifyListeners();
  }

  void setExpenses(Expense newExpense) {
    _allExpenses.add(newExpense);
    notifyListeners();
  }
}
