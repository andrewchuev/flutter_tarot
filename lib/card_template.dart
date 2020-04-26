import 'package:flutter/material.dart';

Widget cardTemplate(tcard) {
  return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/" + tcard['image'] + ".jpg",
              height: 100,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 70, top: 5),
            child: Text(
              tcard['title'],
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 70, top: 30),
            child: Text(
              tcard['desc'],
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ));
}