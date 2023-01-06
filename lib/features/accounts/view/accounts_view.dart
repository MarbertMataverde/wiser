import 'package:flutter/material.dart';
import 'package:wiser/core/constant/core_constant.dart';

class AccountsView extends StatelessWidget {
  const AccountsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: CoreConstant.pageHorizontalPadding,
        child: SafeArea(
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }
}
