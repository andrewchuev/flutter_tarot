import 'package:flutter/material.dart';

Widget cardTemplate(tcard) {
  return Column(

    children: <Widget>[
      Container(
        margin: const EdgeInsets.all(3.0),
        child: Image.asset(
          "assets/images/" + tcard['image'] + ".jpg",
          height: 120,
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(2, 5, 2, 5),
        child: Text(
          tcard['title'],
          style: TextStyle(
            fontSize: 10.0,

          ),
        ),
      )
    ],
  );
}
