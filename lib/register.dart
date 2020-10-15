import 'package:flutter/material.dart';
import 'package:t1_inf1300/StyledButtonOne.dart';

class Register extends StatefulWidget {
  Register();

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Senha'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Confirmar senha'),
            ),
            StyleButtonOne(title: "Registrar", callback: _register)
          ],
        ),
      ),
    );
  }

  void _register() {}
}
