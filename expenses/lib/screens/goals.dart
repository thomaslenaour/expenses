import 'package:expenses/widgets/goal_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:expenses/models/app_state_model.dart';
import 'package:expenses/models/expense.dart';

class GoalsScreen extends StatelessWidget {
  final data = [
    'Objectif Courses',
    'Objectif Alimentation',
    'Objectif Sorties',
    'Objectif 4',
    'Objectif Sports',
  ];

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
                    if (index < data.length) {
                      return GoalRowItem(
                        index: index,
                        title: data[index],
                        amount: 200,
                        category: 'Courses',
                      );
                    }
                    return null;
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
