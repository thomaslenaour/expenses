import 'package:expenses/widgets/custom_card.dart';
import 'package:expenses/widgets/expense_row_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:expenses/models/app_state_model.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() {
    return _AddScreenState();
  }
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, model, child) {
        final expense = model.getExpenses();
        return CustomScrollView(
          semanticChildCount: expense.length,
          slivers: <Widget>[
            const CupertinoSliverNavigationBar(
              largeTitle: Text('Ajouter'),
            ),
            SliverSafeArea(  // BEGINNING OF NEW CONTENT
              top: false,
              minimum: const EdgeInsets.only(top: 8),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index < expense.length) {
                      return ExpenseRowItem(
                        index: index,
                        expense: expense[index],
                        lastItem: index == expense.length - 1,
                      );
                    }

                    return null;
                  },
                ),
              ),
            )                // END OF NEW CONTENT
          ],
        );
      },
    );
  }
}
