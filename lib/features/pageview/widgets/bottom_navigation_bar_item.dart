import 'package:flutter/material.dart';

BottomNavigationBarItem bottomNavigationBarItem({
  String? label,
  required IconData iconData,
}) {
  return BottomNavigationBarItem(
    backgroundColor: Colors.transparent,
    label: label ?? '',
    icon: Icon(iconData),
  );
}
