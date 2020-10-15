import 'package:flutter/material.dart';
import 'package:t1_inf1300/StyledRaisedButton.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword();

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Esqueci a senha"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                'Para recuperar a senha, digite seu email abaixo que iremos enviar uma nova senha',
                style: TextStyle(fontSize: 20)),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
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
