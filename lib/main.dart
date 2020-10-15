import 'package:flutter/material.dart';
import 'package:t1_inf1300/register.dart';
import 'package:t1_inf1300/forgotpassword.dart';
import 'package:t1_inf1300/home.dart';
import 'package:t1_inf1300/StyledRaisedButton.dart';
import 'package:t1_inf1300/StyledFlatButton.dart';
import 'package:t1_inf1300/StyledTextFormField.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pharma +',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Roboto'),
      home: MyHomePage(title: 'Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StyledTextFormField(
              labelText: 'Email',
              maxLines: 1,
              textInputType: TextInputType.emailAddress,
              obscureText: false,
            ),
            StyledTextFormField(
              labelText: 'Senha',
              maxLines: 1,
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            StyledRaisedButton(title: "Entrar", callback: _navigateToHome),
            StyledFlatButton(
              title: "Esqueci a senha",
              callback: _navigateToForgotPassword,
              fontSize: 12,
            ),
            StyledFlatButton(
              title: "Cadastre-se",
              callback: _navigateToRegister,
              fontSize: 16,
            )
          ],
        ),
      ),
    );
  }

  void _navigateToHome() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => new HomePage()));
  }

  void _navigateToRegister() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => new Register()));
  }

  void _navigateToForgotPassword() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => new ForgotPassword()));
  }
}
