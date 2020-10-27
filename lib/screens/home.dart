import 'package:expenses/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'all_expense.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ExpenseModel expenseModel = Provider.of<ExpenseModel>(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Dépenses',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'Vos dernières dépenses',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                for (var item in expenseModel.getExpenses)
                  Container(
                    padding: EdgeInsets.symmetric(vertical:10.0, horizontal: 10),
                    margin: EdgeInsets.only(top: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(7.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:<Widget>[
                            Row(
                                children: <Widget> [
                                  Image(
                                    image: NetworkImage(item.getUrlLogo),
                                    height: 50.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(item.name),
                                  ),
                                ]
                            ),
                            Text(
                              '-' + item.getDescription,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontStyle: FontStyle.italic,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          item.price.toString() + ' €',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.grey[700],
                          ),
                        )
                      ],
                    ),
                  ),
                FlatButton(
                    onPressed:() {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AllExpenses()),
                      );
                    },
                    child: Text('Tap me'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
