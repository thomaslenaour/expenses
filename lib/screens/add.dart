import 'package:flutter/material.dart';
import 'package:expenses/models/expense.dart';
import 'package:provider/provider.dart';
import 'package:expenses/widgets/add_custom_btn.dart';

// expenseModel.getExpenses[0].price.toString()

class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ExpenseModel expenseModel = Provider.of<ExpenseModel>(context);

    return Scaffold(
      body: Container(
        child: Center(
          child: addButton(),
        ),
      ),
    );
  }
}
