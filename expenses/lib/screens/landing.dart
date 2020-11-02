import 'package:expenses/models/app_state_model.dart';
import 'package:expenses/widgets/expense_row_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:expenses/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

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
              child: Column(
                  children: <Widget> [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Container(
                        height: 140,
                        child: new Sparkline(
                          data: [120, 20, 109, 30, 10, 203, 39],
                          lineWidth: 5.0,
                          fillMode: FillMode.below,
                          lineGradient: new LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [CupertinoColors.systemBlue, CupertinoColors.systemTeal],
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Vos dernières dépenses',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ]
              ),
            ),
            SliverSafeArea(
              // BEGINNING OF NEW CONTENT
              top: false,
              minimum: const EdgeInsets.all(8.0),
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: CupertinoButton(
                  borderRadius: new BorderRadius.circular(30.0),
                  child: Text('Voir toutes mes dépenses'),
                  color: CupertinoColors.systemBlue,
                  onPressed: () => globals.tabController.index = 1,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
