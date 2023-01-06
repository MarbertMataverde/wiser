import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wiser/core/constant/core_constant.dart';

GestureDetector transactionCardWidget() {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: double.infinity,
      height: 80,
      child: Card(
        elevation: 0,
        color: CoreConstant.fillColor,
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
                        color: CoreConstant.colorWhite,
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
