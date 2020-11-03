import 'package:flutter/cupertino.dart';
import 'package:expenses/widgets/expense_row_item.dart';
import 'package:provider/provider.dart';
import 'package:expenses/models/app_state_model.dart';

class AllExpensesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, model, child) {
        final expense = model.getReversedExpenses();
        return CustomScrollView(
          slivers: <Widget>[
            const CupertinoSliverNavigationBar(
              largeTitle: Text('Mes dépenses'),
            ),
            SliverSafeArea(
              top: false,
              minimum: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
            ),
          ],
        );
      },
    );
  }
}
