import 'package:flutter/material.dart';

class StyledRaisedButtonLong extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  final bool isEnable;

  StyledRaisedButtonLong({this.title, this.callback, this.isEnable = true});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.95;

    return ButtonTheme(
      minWidth: width,
      buttonColor: Colors.blue,
      disabledColor: Colors.blueGrey,
      highlightColor: Colors.lightBlue,
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: RaisedButton(
          textColor: Colors.white,
          child: Text(title),
          onPressed:
              isEnable ? () => callback : null // gives padding to the button
          ),
    );
  }
}
