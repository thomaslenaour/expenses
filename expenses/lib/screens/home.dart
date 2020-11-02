import 'package:expenses/screens/add.dart';
import 'package:expenses/screens/goals.dart';
import 'package:flutter/cupertino.dart';
import 'package:expenses/screens/landing.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.check_mark),
            label: 'Objectifs',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.plus),
            label: 'Ajouter',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: LandingScreen(),
              );
            });
            break;
          case 1:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: GoalsScreen(),
              );
            });
            break;
          case 2:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: AddScreen(),
              );
            });
            break;
        }
        return returnValue;
      },
    );
  }
}
