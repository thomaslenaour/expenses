import 'package:expenses/models/app_state_model.dart';
import 'package:expenses/widgets/expense_row_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';

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
              largeTitle: Text('Dépenses'),
            ),
            SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15.0, bottom: 15.0),
                  child: Text(
                      'Vos dernières dépenses',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500
                      ),
                  ),
                )
            ),
            SliverSafeArea(  // BEGINNING OF NEW CONTENT
              top: false,
              minimum: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
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
            SliverToBoxAdapter(
              child: CupertinoButton(
                child: Text("Voir toutes mes dépenses"),
                color: Colors.green,
              ),
            )
          ],
        );
      },
    );
  }
}


