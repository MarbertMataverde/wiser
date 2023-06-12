import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wiser/core/constant/core_constant.dart';
import 'package:wiser/features/accounts/icons/accounts_custom_icon_packs.dart';

final accountIconDataStateProvider =
    StateProvider.autoDispose<IconData?>((ref) => EneftyIcons.moneys_outline);

pickAccountIcon({required WidgetRef ref, required BuildContext context}) async {
  IconData? icon = await FlutterIconPicker.showIconPicker(
    context,
    backgroundColor: CoreConstant.scaffoldBackgroundColor,
    barrierDismissible: false,
    iconPickerShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    iconPackModes: [IconPack.custom],
    customIconPack: accountsCustomIconPacks,
    searchIcon: const Icon(Iconsax.search_normal),
    iconColor: CoreConstant.primaryTextColor,
    title: const Text('Pick Account Icon'),
    noResultsText: 'Cant find your desired icon',
  );

  if (icon != null) {
    ref.read(accountIconDataStateProvider.notifier).update((state) => icon);
  }
}
