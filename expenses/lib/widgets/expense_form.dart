import 'package:expenses/screens/home.dart';
import 'package:expenses/models/expense.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

// Consumer<AppStateModel>(
//       builder: (context, model, child) {
//         final expense = model.getExpenses();
//         return

class ExpenseForm extends StatefulWidget {
  @override
  _ExpenseFormState createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    int selectedCategory;
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Catégorie",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      height: 130,
                      child: CupertinoPicker(
                          useMagnifier: true,
                          onSelectedItemChanged: (value) {
                            selectedCategory = value;
                          },
                          itemExtent: 32.0,
                          children: categoryModel.getCategories
                              .map((category) => Text(category.title))
                              .toList())),
                ]),
          ),
          CustomField(
            hintText: 'Titre',
            validator: (String value) {
              if (value.isEmpty) {
                return 'Entrez un titre de dépense ';
              }
            },
            onSaved: (String value) {
              expense.name = value;
            },
          ),
          CustomField(
            hintText: 'Description',
            onSaved: (String value) {
              if(value.isNotEmpty) {
                expense.description = value;
              }
            },
          ),
          CustomField(
            hintText: 'Enseigne',
            validator: (String value) {
              if (value.isEmpty) {
                return 'Renseignez où vous avez fait vôtre dépense';
              }
            },
            onSaved: (String value) {
              String url = 'https://logo.clearbit.com/' + value.toLowerCase() + '.com';
              expense.urlLogo = url;
            },
          ),
          CustomField(
            hintText: 'Montant en €',
            isEmail: false,
            validator: (String value) {
              double convertVal = double.parse(value);
              if (value.isEmpty) {
                return "Veuillez renseigner le montant";
              } else if (convertVal.isNaN) {
                return "Le montant doit être un nombre";
              } else if (convertVal.isNegative) {
                return "Le montant doit être positif";
              }
            },
            onSaved: (String value) {
              expense.price = double.parse(value);
            },
          ),
          CupertinoButton(
            color: CupertinoColors.systemBlue,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                expense.category =
                    categoryModel.getCategories[selectedCategory];
                expenseModel.addExpense(expense);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              }
            },
            child: Text(
              'Ajouter',
              style: TextStyle(
                color: CupertinoColors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}