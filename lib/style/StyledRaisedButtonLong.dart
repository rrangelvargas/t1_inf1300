import 'package:flutter/material.dart';

class StyledRaisedButtonLong extends StatefulWidget {
  final String title;
  final VoidCallback callback;
  final bool isEnable;
  StyledRaisedButtonLong({this.title, this.callback, this.isEnable = true});

  @override
  _StyledRaisedButtonLong createState() => new _StyledRaisedButtonLong();
}

class _StyledRaisedButtonLong extends State<StyledRaisedButtonLong> {
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
          child: Text(widget.title),
          onPressed: widget.isEnable
              ? () => widget.callback()
              : null // gives padding to the button
          ),
    );
  }
}
