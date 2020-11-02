import 'package:expenses/models/app_state_model.dart';
import 'package:expenses/widgets/expense_row_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, model, child) {
        final expense = model.getExpenses();
        return CustomScrollView(
          semanticChildCount: expense.length,
          slivers: <Widget>[
            const CupertinoSliverNavigationBar(
              largeTitle: Text('Expenses'),
            ),
            SliverSafeArea(
              // BEGINNING OF NEW CONTENT
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
            ),
          ],
        );
      },
    );
  }
}
