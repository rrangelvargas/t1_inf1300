import 'package:flutter/material.dart';
import 'package:t1_inf1300/StyledRaisedButton.dart';
import 'package:t1_inf1300/StyledTextFormField.dart';
import 'dart:io';

class Register extends StatefulWidget {
  Register();

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String registerLabelText = "";
  String nameLabelText = "";
  String passwordLabelText = "";
  String confirmPasswordLabeltext = "";
  String confirmRegisterLabelText = "";
  String locale = "";

  @override
  Widget build(BuildContext context) {
    locale = Platform.localeName.substring(0, 2);

    if (locale == "pt") {
      this.registerLabelText = "Cadastro";
      this.nameLabelText = "Nome";
      this.passwordLabelText = "Senha";
      this.confirmPasswordLabeltext = "Confirmar senha";
      this.confirmRegisterLabelText = "Registrar";
    } else if (locale == "es") {
      this.registerLabelText = "Registrarse";
      this.nameLabelText = "Nombre";
      this.passwordLabelText = "Contraseña";
      this.confirmPasswordLabeltext = "Confirmar Seña";
      this.confirmRegisterLabelText = "Finalizar el registro";
    } else {
      this.registerLabelText = "Register";
      this.nameLabelText = "Name";
      this.passwordLabelText = "Password";
      this.confirmPasswordLabeltext = "Confirm Password";
      this.confirmRegisterLabelText = "Finnish registration";
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(this.registerLabelText),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StyledTextFormField(
              labelText: this.nameLabelText,
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
              labelText: this.passwordLabelText,
              maxLines: 1,
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            StyledTextFormField(
              labelText: this.confirmPasswordLabeltext,
              maxLines: 1,
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: StyledRaisedButton(
                    title: this.confirmRegisterLabelText, callback: _register))
          ],
        ),
      ),
    );
  }

  void _register() {}
}
