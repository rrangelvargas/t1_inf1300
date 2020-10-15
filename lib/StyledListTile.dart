import 'package:flutter/material.dart';

class StyledListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String leading;
  final String trailing;

  StyledListTile({this.title, this.subtitle, this.leading, this.trailing});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.9;

    return Container(
      width: width,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Text(leading),
        trailing: Text(trailing),
      ),
    );
  }
}
