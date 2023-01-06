import 'package:flutter/material.dart';

SizedBox loginTaglineWidget(BuildContext context) {
  return SizedBox(
    width: 300,
    child: FittedBox(
      child: Text(
        'Wiser\nYour budget\nbuddy anywhere',
        style: TextStyle(
          height: 1,
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
    ),
  );
}
