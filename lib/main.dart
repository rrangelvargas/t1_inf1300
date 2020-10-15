import 'package:flutter/material.dart';
import 'package:t1_inf1300/register.dart';
import 'package:t1_inf1300/forgotpassword.dart';
import 'package:t1_inf1300/home.dart';
import 'package:t1_inf1300/StyledRaisedButton.dart';

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
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Senha'),
            ),
            StyledRaisedButton(title: "Entrar", callback: _navigateToHome),
            FlatButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => new ForgotPassword()));
              },
              child: Text(
                "Esqueci a senha",
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => new Register()));
              },
              child: Text(
                "Cadastre-se",
              ),
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
}
