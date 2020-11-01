import 'package:expenses/screens/add_goal.dart';
import 'package:flutter/material.dart';
import 'package:expenses/models/expense.dart';
import 'package:provider/provider.dart';
import 'package:expenses/widgets/add_custom_btn.dart';
import 'add_expense.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// expenseModel.getExpenses[0].price.toString()
//AddButton("assets/images/finance_graph.png", "Nouvelle Dépense")
class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ExpenseModel expenseModel = Provider.of<ExpenseModel>(context);

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Ajouter',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                'Ajouter vos dépenses et objectifs',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              FlatButton(
                padding: EdgeInsets.all(0),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  showBarModalBottomSheet(
                    expand: false,
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context, scrollController) => AddExpenseScreen(),
                  );
                },
                child: AddButton("assets/images/expense.png",
                    "Nouvelle \nDépense", Color.fromRGBO(146, 207, 212, 100)),
              ),
              FlatButton(
                padding: EdgeInsets.all(0),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  showBarModalBottomSheet(
                    expand: false,
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context, scrollController) => AddGoalScreen(),
                  );
                },
                child: AddButton("assets/images/graphics.png",
                    "Nouvel \nObjectif", Color.fromRGBO(247, 205, 89, 100)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
