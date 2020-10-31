import 'dart:ffi';
import 'dart:math';
import 'package:expenses/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart' as validator;
import 'package:expenses/models/goal.dart';
import 'package:expenses/widgets/form_field.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class GoalForm extends StatefulWidget {
  @override
  _GoalFormState createState() => _GoalFormState();
}

class _GoalFormState extends State<GoalForm> {
  final _formKey = GlobalKey<FormState>();
  Goal goal = Goal();
  DateTime _setDate = DateTime.now();
  Duration initialtimer = new Duration();
  int selectitem = 1;

  @override
  Widget build(BuildContext context) {
    final GoalModel goalModel = Provider.of<GoalModel>(context);
    return Form(
      key: _formKey,
      child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CustomField(
            hintText: "Titre de l'objectif",
            validator: (String value) {
              if (value.isEmpty) {
                return "Entrez un titre d'objectif";
              }
            },
            onSaved: (String value) {
              goal.title = value;
            },
          ),
          CustomField(
            hintText: 'Montant à ne pas dépasser',
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
              goal.maxAmount = double.parse(value);
            },
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child:           
            Text(
              'Date de départ',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            height: 160,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: CupertinoDatePicker(
              initialDateTime: DateTime.now(),
              onDateTimeChanged: (DateTime newdate) {
                print(newdate);
              },
              use24hFormat: true,
              mode: CupertinoDatePickerMode.date,
            )
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child:           
            Text(
              'Date de fin',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            height: 160,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: CupertinoDatePicker(
              initialDateTime: DateTime.now(),
              onDateTimeChanged: (DateTime newdate) {
                print(newdate);
              },
              use24hFormat: true,
              mode: CupertinoDatePickerMode.date,
            )
          ),
          FlatButton(
            color: Colors.blueAccent,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              }
            },
            child: Text(
              'Ajouter',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
