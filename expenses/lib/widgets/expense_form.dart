import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:expenses/models/app_state_model.dart';

class ExpenseForm extends StatefulWidget {
  @override
  _ExpenseFormState createState() {
    return _ExpenseFormState();
  }
}

class _ExpenseFormState extends State<ExpenseForm> {
  String title;
  double amount;
  String urlLogo;
  String description;

  Widget _buildTitleField() {
    return CupertinoTextField(
      prefix: const Icon(
        CupertinoIcons.pencil,
        color: CupertinoColors.lightBackgroundGray,
        size: 28,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      clearButtonMode: OverlayVisibilityMode.editing,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0,
            color: CupertinoColors.inactiveGray,
          ),
        ),
      ),
      placeholder: 'Titre',
      onChanged: (newName) {
        setState(() {
          title = newName;
        });
      },
    );
  }

  Widget _buildAmountField() {
    return CupertinoTextField(
      prefix: const Icon(
        CupertinoIcons.money_euro,
        color: CupertinoColors.lightBackgroundGray,
        size: 28,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      clearButtonMode: OverlayVisibilityMode.editing,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0,
            color: CupertinoColors.inactiveGray,
          ),
        ),
      ),
      placeholder: 'Montant',
      onChanged: (newAmount) {
        setState(() {
          amount = double.parse(newAmount);
        });
      },
    );
  }

  Widget _buildUrlLogoField() {
    return CupertinoTextField(
      prefix: const Icon(
        CupertinoIcons.bag,
        color: CupertinoColors.lightBackgroundGray,
        size: 28,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      clearButtonMode: OverlayVisibilityMode.editing,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0,
            color: CupertinoColors.inactiveGray,
          ),
        ),
      ),
      placeholder: 'Enseigne',
      onChanged: (newUrl) {
        setState(() {
          urlLogo = newUrl;
        });
      },
    );
  }

  Widget _buildDescriptionField() {
    return CupertinoTextField(
      prefix: const Icon(
        CupertinoIcons.pencil,
        color: CupertinoColors.systemGrey,
        size: 28,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      clearButtonMode: OverlayVisibilityMode.editing,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0,
            color: CupertinoColors.inactiveGray,
          ),
        ),
      ),
      placeholder: 'Description',
      onChanged: (newDesc) {
        setState(() {
          title = newDesc;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, model, child) {
        return Container(
            child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            child: _buildTitleField(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            child: _buildDescriptionField(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            child: _buildUrlLogoField(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            child: _buildAmountField(),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CupertinoButton(
              color: CupertinoColors.systemBlue,
              child: Text("Ajouter"),
              onPressed: () => print("Toto"),
            ),
          )
        ]));
      },
    );
  }
}
