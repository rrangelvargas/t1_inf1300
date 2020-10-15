import 'package:flutter/material.dart';

class StyledFlatButton extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  final double fontSize;

  StyledFlatButton({this.title, this.callback, this.fontSize});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.6;

    return ButtonTheme(
      minWidth: width,
      buttonColor: Colors.transparent,
      disabledColor: Colors.transparent,
      highlightColor: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: FlatButton(
        textColor: Colors.black,
        child: Text(title,
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Roboto', fontSize: fontSize)),
        onPressed: callback, // gives padding to the button
      ),
    );
  }
}
