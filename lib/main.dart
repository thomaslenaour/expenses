import 'package:expenses/models/expense.dart';
import 'package:expenses/models/setting.dart';
import 'package:expenses/screens/home.dart';
import 'package:expenses/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ExpenseModel>.value(
          value: ExpenseModel(),
        ),
        ChangeNotifierProvider<SettingsModel>.value(
          value: SettingsModel(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/settings': (context) => SettingsScreen(),
        },
      ),
    );
  }
}
