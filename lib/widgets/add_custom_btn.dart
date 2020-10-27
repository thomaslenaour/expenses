import 'package:flutter/material.dart';

class addButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Text(""),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
      ),
    );
  }
}
