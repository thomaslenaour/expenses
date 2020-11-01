import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CategoryModel extends ChangeNotifier {
  static List<Category> categoriesList = [
    Category(title: "Alimentation", color: "#6dd189"),
    Category(title: "Abonnements", color: "#6d93d1"),
    Category(title: "Librairies", color: "#d1a66d"),
    Category(title: "Restaurants", color: "#d4866e"),
    Category(title: "Sorties", color: "#6d70d1"),
    Category(title: "Santé", color: "#26b3b5"),
    Category(title: "Soins et beauté", color: "#9c6c51"),
    Category(title: "Factures", color: "#565a69"),
    Category(title: "Shopping", color: "#db404f"),
    Category(title: "Autres", color: "#919191"),
    ];

  List<Category> get getCategories => categoriesList;
}

class Category {
  Uuid id = Uuid();
  String title;
  String color; // Hex color in order to use Color.fromHex(category.color)

  Category({this.title, this.color});

  String get getTitle => title;
  String get getColor => color;

  changeTitle (String newTitle) {
    title = newTitle;
  }
}
