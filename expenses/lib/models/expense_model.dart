import 'expense.dart';

class ExpenseModel {
  static const _allExpenses = <Expense>[
    Expense(
      category: Category.Shopping,
      id: 0,
      description: "Achat Mac",
      name: 'Apple Store',
      amount: 120,
      urlLogo: "https://logo.clearbit.com/apple.fr"
    ),
  ];

  static List<Expense> loadExpenses(Category category) {
    if (category == Category.Toutes) {
      return _allExpenses;
    } else {
      return _allExpenses.where((p) => p.category == category).toList();
    }
  }


}