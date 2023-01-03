import 'package:flutter/material.dart';
import 'package:wiser/features/dashboard/view/view_dashboard.dart';
import 'package:wiser/features/budget/view/view_budget.dart';
import 'package:wiser/features/transactions/view/view_transactions.dart';
import 'package:wiser/features/calendar/view/calendar.dart';

const List<Widget> pageList = <Widget>[
  Dashboard(),
  Budget(),
  Transactions(),
  Wisedar(),
];
