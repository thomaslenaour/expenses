import 'package:expenses/screens/home.dart';
import 'package:expenses/widgets/custom_card.dart';
import 'package:expenses/widgets/expense_row_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:expenses/models/app_state_model.dart';
import 'package:expenses/globals.dart' as globals;


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
            SliverToBoxAdapter(
              child: 
              CupertinoButton(
                child: 
                  AddButton("assets/images/expense.png",
                        "Nouvelle \nDépense", Color.fromRGBO(146, 207, 212, 100)
                        ),
                onPressed: () => print("add expense"),
                )
            ),
            SliverToBoxAdapter(
              child: 
              CupertinoButton(
                child: 
                  AddButton("assets/images/graphics.png",
                    "Nouvel \nObjectif", Color.fromRGBO(247, 205, 89, 100)),
                onPressed: () => globals.tabController.index = 1,
                )
            )
            ,
          ],
        );
      },
    );
  }
}
