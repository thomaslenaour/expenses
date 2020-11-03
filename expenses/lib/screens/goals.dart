import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expenses/widgets/goal_card.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:expenses/models/app_state_model.dart';
import 'package:expenses/models/expense.dart';
import 'package:expenses/models/goal.dart';

class GoalsScreen extends StatelessWidget {
  final percentages = [32, 49, 70, 92, 76, 66, 21, 88, 97];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, model, child) {
        final goals = model.getGoals();
        var listTotalAmounts = [];
        for (var i = 0; i < goals.length; i++) {
          var amounts = [];
          final expenses = model.getExpenseByCategory(goals[i].category.index);
          expenses.forEach((exp) {
            amounts.add(exp.amount);
          });
          var sum = amounts.reduce((a, b) => a + b);
          listTotalAmounts.add(sum);
        }

        return CustomScrollView(
          slivers: <Widget>[
            const CupertinoSliverNavigationBar(
              largeTitle: Text('Objectifs'),
            ),
            SliverSafeArea(
              top: false,
              minimum: const EdgeInsets.only(top: 8),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index < goals.length) {
                      return GoalRowItem(
                        index: index,
                        title: goals[index].name,
                        amount: goals[index].maxAmount,
                        percentage:
                            listTotalAmounts[index] / goals[index].maxAmount,
                        category:
                            goals[index].category.toString().split('.')[1],
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
