import 'expense.dart';

class ExpenseModel {
  static var _allExpenses = <Expense>[
    Expense(
        category: Category.Shopping,
        id: 0,
        description: "Achat Mac",
        name: 'Apple Store',
        amount: 0,
        urlLogo: "https://logo.clearbit.com/apple.fr"),
    Expense(
        category: Category.Shopping,
        id: 1,
        description: "Air Force One",
        name: 'Nike Store',
        amount: 99.99,
        urlLogo: "https://logo.clearbit.com/nike.com"),
    Expense(
        category: Category.Shopping,
        id: 2,
        description: "Abonnement Spotify",
        name: 'Spotify',
        amount: 75,
        urlLogo: "https://logo.clearbit.com/spotify.com"),
    Expense(
        category: Category.Shopping,
        id: 2,
        description: "Abonnement Netlifx",
        name: 'Netflix',
        amount: 134,
        urlLogo: "https://logo.clearbit.com/netflix.com"),
    Expense(
        category: Category.Shopping,
        id: 2,
        description: "Courses",
        name: 'Géant',
        amount: 89,
        urlLogo: "https://logo.clearbit.com/geantcasino.fr"),
    Expense(
        category: Category.Shopping,
        id: 2,
        description: "Repas lundi midi",
        name: 'MacDo',
        amount: 120,
        urlLogo: "https://logo.clearbit.com/mcdonalds.fr"),

  ];

  static List<Expense> loadExpenses() {
    return _allExpenses;
  }

}
