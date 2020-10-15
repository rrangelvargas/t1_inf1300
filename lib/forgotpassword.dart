import 'package:flutter/material.dart';
import 'package:t1_inf1300/StyledRaisedButton.dart';
import 'package:t1_inf1300/StyledTextFormField.dart';

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
        title: Text("Esqueci a senha"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: width,
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Para recuperar a senha, digite seu email abaixo que iremos enviar uma nova senha',
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
                title: "Recuperar senha", callback: _forgotPassword),
          ],
        ),
      ),
    );
  }

  void _forgotPassword() {}
}
