import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wiser/core/constant/core_constant.dart';
import 'package:wiser/features/dashboard/widgets/dashboard_account_list_widget.dart';
import 'package:wiser/features/dashboard/widgets/dashboard_heading_widget.dart';
import 'package:wiser/features/dashboard/widgets/dashboard_summary_card_widget.dart';
import 'package:wiser/features/dashboard/widgets/dashboard_transaction_card_widget.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<DashboardView> {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Padding(
          padding: CoreConstant.pageHorizontalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              dashboardSummaryCardWidget(context),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Accounts',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              dashboardAccountsListWidget(),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Transactions',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'View all',
                      textScaleFactor: 0.8,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return transactionCardWidget();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
