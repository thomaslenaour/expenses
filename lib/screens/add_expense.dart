import 'package:expenses/widgets/expense_form.dart';
import 'package:flutter/material.dart';
import 'package:expenses/models/expense.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

// expenseModel.getExpenses[0].price.toString()
//AddButton("assets/images/finance_graph.png", "Nouvelle Dépense")
class AddExpenseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ExpenseModel expenseModel = Provider.of<ExpenseModel>(context);
    Uuid selectedCategory;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Nouvelle Dépense',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Remplissez le formulaire ci-dessous',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),),
              Image.asset("assets/images/shop.png",
              fit: BoxFit.cover),
              ExpenseForm()
            ],
          ),
        ),
      ),
    );
  }
}
