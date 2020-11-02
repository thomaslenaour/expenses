import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expenses/widgets/goal_card.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:expenses/models/app_state_model.dart';
import 'package:expenses/models/expense.dart';

class GoalsScreen extends StatelessWidget {
  final goals = [
    'Objectif Courses',
    'Objectif Alimentation',
    'Objectif Sorties',
    'Objectif 4',
    'Objectif Sports',
    'Objectif Sports',
    'Objectif Sports',
    'Objectif Sports',
    'Objectif Sports',
  ];
  final percentages = [32, 49, 70, 92, 76, 66, 21, 88, 97];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, model, child) {
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
                        title: goals[index],
                        amount: 200,
                        percentage: percentages[index] / 100,
                        category: 'Courses',
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
