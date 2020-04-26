import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Route"),
        ),
        body: ListView(
          children: <Widget>[
            Text('Settings'),
          ],
        ),
      );
  }
}
