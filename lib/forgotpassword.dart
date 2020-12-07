import 'package:flutter/material.dart';
import 'package:t1_inf1300/StyledRaisedButton.dart';
import 'package:t1_inf1300/StyledTextFormField.dart';
import 'package:t1_inf1300/localizations.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword();

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
      appBar: AppBar(
        title: Text(MyLocalizations.of(context).translate("forgotPassword")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: width,
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                MyLocalizations.of(context).translate("forgotPasswordHelp"),
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            StyledTextFormField(
              labelText: 'Email',
              maxLines: 1,
              textInputType: TextInputType.emailAddress,
              obscureText: false,
            ),
            StyledRaisedButton(
                title: MyLocalizations.of(context).translate("recoverPassword"),
                callback: _forgotPassword),
          ],
        ),
      ),
    );
  }

  void _forgotPassword() {}
}
