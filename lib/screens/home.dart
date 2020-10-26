import 'package:expenses/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ExpenseModel expenseModel = Provider.of<ExpenseModel>(context);

    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var item in expenseModel.getExpenses)
                Column(
                  children: [
                    Text(item.name.toString()),
                    Text(item.price.toString() + '€'),
                  ],
                ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
                child: Text(
                  'Tap Me',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
