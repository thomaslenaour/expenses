import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:expenses/models/expense.dart';


class GoalsScreen extends StatefulWidget {
  @override
  _GoalsScreenState createState() {
    return _GoalsScreenState();
  }
}

class _GoalsScreenState extends State<GoalsScreen> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Objectifs'),
        ),
      ],
    );
  }
}