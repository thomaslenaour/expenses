import 'package:flutter/material.dart';

class AddButton extends StatefulWidget {
  final String image;
  final String cardText;
  final Color backgroundColor;

  AddButton(this.image, this.cardText, this.backgroundColor);

  @override
  _AddButtonState createState() =>
      _AddButtonState(image, cardText, backgroundColor);
}

class _AddButtonState extends State<AddButton> {
  String image;
  String cardText;
  Color backgroundColor;
  _AddButtonState(this.image, this.cardText, this.backgroundColor);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 220,
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(5, 25, 5, 0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 12,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: widget.backgroundColor
        ),
        child: Container(
          margin: EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.cardText,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 29,
                    fontWeight: FontWeight.w600,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(3.0, 3.0),
                        blurRadius: 14.0,
                        color: Colors.grey[700],
                      ),
                    ]),
              ),
            ],
          ),
        ));
  }
}
