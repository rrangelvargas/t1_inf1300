import 'package:flutter/material.dart';

class StyledTextFormField extends StatelessWidget {
  final String labelText; //label do form
  final int maxLines; // maximo de linhas
  final TextInputType textInputType; // tipo de input do form
  final bool
      obscureText; // caso seja uma senha, passar true para a senha não ficar visivel

  StyledTextFormField(
      {this.labelText, this.maxLines, this.textInputType, this.obscureText});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.8;

    return Container(
      width: width,
      child: TextFormField(
        autofocus: false,
        maxLines: maxLines,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
        ),
        keyboardType: textInputType,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
      ),
    );
  }
}
