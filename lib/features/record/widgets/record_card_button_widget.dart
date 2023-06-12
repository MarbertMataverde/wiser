import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wiser/core/constant/core_constant.dart';

InkWell recordCardButtonWidget({
  required Function()? onTap,
  required IconData iconData,
  required String title,
  Color? iconBackgroundColor,
  bool isHasPrefixIcon = false,
  bool isExpanded = false,
  Function()? expandIconOnPressed,
}) {
  return InkWell(
    onTap: onTap,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        height: 70,
        width: double.infinity,
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
                      height: 40,
                      width: 40,
                      color: iconBackgroundColor ??
                          CoreConstant.secondaryTextColor,
                      child: Icon(
                        iconData,
                        color: CoreConstant.colorWhite,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: isHasPrefixIcon,
                child: IconButton(
                  splashRadius: 24,
                  onPressed: expandIconOnPressed ?? () {},
                  icon: Icon(
                    isExpanded ? Iconsax.arrow_up_2 : Iconsax.arrow_down_1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
