import 'package:flutter/material.dart';
import 'package:t1_inf1300/StyledRaisedButton.dart';
import 'package:t1_inf1300/StyledTextFormField.dart';
import 'package:t1_inf1300/localizations.dart';

class Register extends StatefulWidget {
  Register();

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(MyLocalizations.of(context).translate("registerLabel")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StyledTextFormField(
              labelText: MyLocalizations.of(context).translate("nameLabel"),
              maxLines: 1,
              textInputType: TextInputType.name,
              obscureText: false,
            ),
            StyledTextFormField(
              labelText: 'Email',
              maxLines: 1,
              textInputType: TextInputType.emailAddress,
              obscureText: false,
            ),
            StyledTextFormField(
              labelText: MyLocalizations.of(context).translate("password"),
              maxLines: 1,
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            StyledTextFormField(
              labelText:
                  MyLocalizations.of(context).translate("confirmPassword"),
              maxLines: 1,
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: StyledRaisedButton(
                    title: MyLocalizations.of(context)
                        .translate("confirmRegistration"),
                    callback: _register))
          ],
        ),
      ),
    );
  }

  void _register() {}
}
