import 'package:expenses/models/expense.dart';
import 'package:expenses/models/goal.dart';
import 'package:expenses/screens/goals.dart';
import 'package:expenses/screens/home.dart';
import 'package:expenses/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedScreen = 0;
  static List<Widget> _screenOptions = [
    HomeScreen(),
    GoalsScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ExpenseModel>.value(
          value: ExpenseModel(),
        ),
        ChangeNotifierProvider<GoalsModel>.value(
          value: GoalsModel(),
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Expenses'),
            backgroundColor: Colors.black,
          ),
          body: Center(
            child: _screenOptions.elementAt(_selectedScreen),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Accueil',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check),
                label: 'Objectifs',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Nouveau',
              ),
            ],
            currentIndex: _selectedScreen,
            selectedItemColor: Colors.black,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
