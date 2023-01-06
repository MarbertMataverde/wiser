import 'package:flutter/material.dart';
import 'package:wiser/features/accounts/view/accounts_view.dart';
import 'package:wiser/features/dashboard/view/dashboard_view.dart';
import 'package:wiser/features/budget/view/budget_view.dart';
import 'package:wiser/features/transactions/view/transactions_view.dart';
import 'package:wiser/features/calendar/view/calendar_view.dart';

const List<Widget> pageList = <Widget>[
  DashboardView(),
  TransactionsView(),
  BudgetView(),
  AccountsView(),
  WisedarView(),
];
