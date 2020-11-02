import 'package:flutter/material.dart';
import 'package:expenses/models/app_state_model.dart';
import 'package:provider/provider.dart';

class AllExpensesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer <AppStateModel>(
      builder: (contex, child, model) {
        return Center(
          child: Text('All Expenses'),
        );
      }
    );
  }
}
