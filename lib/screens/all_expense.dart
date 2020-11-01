import 'package:expenses/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';

class AllExpenses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ExpenseModel expenseModel = Provider.of<ExpenseModel>(context);

    return MaterialApp(
        home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                      'Retour à l\'accueil',
                      style: TextStyle(
                        color: HexColor("#6d70d1"),
                        fontSize: 15.0
                      ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          Text(
                            'Toutes vos dépenses',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          for(var item in expenseModel.getExpenses)
                            Card(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical:10, horizontal: 10),
                                margin: EdgeInsets.only(top: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
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
                                                width: 50.0,
                                                fit: BoxFit.contain,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(item.name,
                                                        style:
                                                        TextStyle(
                                                            fontWeight: FontWeight.w600),
                                                      ),
                                                      Text(item.category.title,
                                                          style:
                                                          TextStyle(
                                                              color: HexColor(item.category.color),
                                                              fontWeight: FontWeight.w300
                                                          )
                                                      ),
                                                    ]
                                                ),
                                              )
                                            ]
                                        ),
                                        SizedBox(height: 5.0,),
                                        Text(
                                          '- ' + item.getDescription,
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
                            ),
                        ]
                    ),
                  ),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
