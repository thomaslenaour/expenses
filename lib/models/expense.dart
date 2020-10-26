import 'package:uuid/uuid.dart';

class Expense {
  Uuid id = Uuid();
  String name;
  String description;
  double price; // €

  Expense(this.name, this.description, this.price);
}
