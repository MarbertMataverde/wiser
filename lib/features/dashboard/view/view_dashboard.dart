import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wiser/core/constant.dart';
import 'package:wiser/features/authentication/login/services/sign_out_services.dart';
import 'package:wiser/features/record/view/view_new_record.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome!',
                      ),
                      FittedBox(
                        child: Text(
                          user!.displayName!,
                          textScaleFactor: 1.2,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      signOut();
                    },
                    child: const Icon(Iconsax.setting),
                  ),
                ],
              ),
              SizedBox(
                height: 230,
                width: double.infinity,
                child: Card(
                  elevation: 0,
                  color: Constant.fillColor,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Total Balance',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            '₱ 8,910.00',
                            textScaleFactor: 2.5,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            incomeExpensesCard(value: '3,456.00'),
                            incomeExpensesCard(
                                value: '2,345.00', isIncome: false)
                          ],
                        ),
                        TextButton.icon(
                          style: TextButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).primaryColor.withAlpha(20)),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NewRecord(),
                              )),
                          icon: const Icon(
                            Iconsax.receipt_add,
                            size: 20,
                          ),
                          label: const Text(
                            'New Record',
                            textScaleFactor: 0.9,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Accounts',
                textScaleFactor: 1.1,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Card(
                          child: FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: const [
                                  Icon(Iconsax.wallet_2),
                                  Text('Cash'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Transactions',
                    textScaleFactor: 1.1,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'View all',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return transactionCard();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector transactionCard() {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: double.infinity,
        height: 80,
        child: Card(
          elevation: 0,
          color: Constant.fillColor,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        color: Colors.orange,
                        height: 40,
                        width: 40,
                        child: const Icon(
                          FontAwesomeIcons.utensils,
                          color: Constant.colorWhite,
                        ),
                      ),
                    ),

                    // title
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Food & Drinks',
                      textScaleFactor: 1.2,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                // category icon

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // amount
                    FittedBox(
                      child: Text(
                        '-₱280',
                      ),
                    ),
                    // date
                    FittedBox(
                      child: Text(
                        'Today',
                        textScaleFactor: 0.8,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Row incomeExpensesCard({
  bool isIncome = true,
  required String value,
}) {
  return Row(
    children: [
      Visibility(
        visible: isIncome ? true : false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              isIncome ? Iconsax.arrow_down_2 : Iconsax.arrow_up_1,
              color: isIncome ? Constant.greenColor : Constant.redColor,
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            isIncome ? 'Income' : 'Expenses',
            textScaleFactor: 0.9,
          ),
          FittedBox(
            child: Text(
              '₱ $value',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      Visibility(
        visible: isIncome ? false : true,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10,
            ),
            Icon(
              isIncome ? Iconsax.arrow_down_2 : Iconsax.arrow_up_1,
              color: isIncome ? Constant.greenColor : Constant.redColor,
            ),
          ],
        ),
      ),
    ],
  );
}
