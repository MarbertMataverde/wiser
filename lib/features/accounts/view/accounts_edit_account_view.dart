// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:wiser/core/widgets/core_appbar_widget.dart';
import 'package:wiser/core/widgets/core_arrow_left_button_widget.dart';

class AccountsEditAccountView extends ConsumerStatefulWidget {
  const AccountsEditAccountView({
    super.key,
    required this.accountName,
  });

  final String accountName;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      AccountsEditAccountState();
}

class AccountsEditAccountState extends ConsumerState<AccountsEditAccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: coreAppBarWidget(
        context: context,
        ref: ref,
        isWrapperAppbar: false,
        nonPageWrapperAppbarTitle: widget.accountName,
        leadingWidget: coreArrowLeftButtonWidget(context),
      ),
      body: Center(
        child: Text('Edit Account View'),
      ),
    );
  }
}
