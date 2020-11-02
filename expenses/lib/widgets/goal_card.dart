import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:expenses/models/app_state_model.dart';
import 'package:expenses/models/expense.dart';
import 'package:expenses/styles.dart';

class GoalRowItem extends StatelessWidget {
  const GoalRowItem({
    this.index,
    this.title,
    this.amount,
    this.category,
  });

  final int index;
  final String title;
  final int amount;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
      margin: EdgeInsets.only(bottom: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${title}',
                style: Styles.expenseRowItemName,
              ),
              SizedBox(height: 7.5),
              Text(
                '${category} • ${amount} €',
                style: Styles.expenseRowItemPrice,
              )
            ],
          ),
          Text(
            'chart here',
            style: TextStyle(fontSize: 12.0),
          )
        ],
      ),
    );
  }
}
