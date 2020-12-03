import 'package:flutter/material.dart';
import 'package:t1_inf1300/StyledRaisedButton.dart';
import 'package:t1_inf1300/StyledTextFormField.dart';
import 'dart:io';

class ForgotPassword extends StatefulWidget {
  ForgotPassword();

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String forgotPasswordLabelText = "";
  String forgotPasswordHelpLabelText = "";
  String recoverPasswordLabeltext = "";
  String locale = "";

  @override
  Widget build(BuildContext context) {
    locale = Platform.localeName.substring(0, 2);

    if (locale == "pt") {
      this.forgotPasswordLabelText = "Esqueci a senha";
      this.forgotPasswordHelpLabelText =
          "Para recuperar a senha, digite seu email abaixo que iremos enviar uma nova senha";
      this.recoverPasswordLabeltext = "Recuperar senha";
    } else if (locale == "es") {
      this.forgotPasswordLabelText = "Olvidé la Contraseña";
      this.forgotPasswordHelpLabelText =
          "Para recuperar su contraseña, ingrese su correo electrónico a continuación y le enviaremos una nueva contraseña";
      this.recoverPasswordLabeltext = "Recuperar contraseña";
    } else {
      this.forgotPasswordLabelText = "Forgot my password";
      this.forgotPasswordHelpLabelText =
          "To recover your password, enter your registered email below and we will be sent a new password";
      this.recoverPasswordLabeltext = "Recover password";
    }

    var width = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
      appBar: AppBar(
        title: Text(this.forgotPasswordLabelText),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: width,
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                this.forgotPasswordHelpLabelText,
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
                title: this.recoverPasswordLabeltext,
                callback: _forgotPassword),
          ],
        ),
      ),
    );
  }

  void _forgotPassword() {}
}
