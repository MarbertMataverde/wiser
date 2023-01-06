import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

SizedBox dashboardAccountsListWidget() {
  return SizedBox(
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
  );
}
