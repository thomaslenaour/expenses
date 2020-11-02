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
