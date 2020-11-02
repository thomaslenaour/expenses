import 'package:flutter/foundation.dart';

enum Category {
  Autres,
  Shopping,
  Abonnements,
  Factures,
  Toutes
}

class Expense {
  const Expense(
      {@required this.category,
      @required this.id,
      @required this.description,
      @required this.name,
      @required this.amount,
      @required this.urlLogo})
      : assert(category != null),
        assert(id != null),
        assert(description != null),
        assert(name != null),
        assert(amount != null),
        assert(urlLogo != null);

  final Category category;
  final int id;
  final String description;
  final String name;
  final double amount;
  final String urlLogo;

  String getName() => name;
  // String get assetName => '$id-0.jpg';
  // String get assetPackage => 'shrine_images';

  @override
  String toString() => '$name (id=$id)';
}
