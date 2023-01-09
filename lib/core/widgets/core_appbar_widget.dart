import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wiser/core/widgets/core_icon_button_widget.dart';
import 'package:wiser/features/pageview/view/page_wrapper_view.dart';

AppBar coreAppBarWidget({
  required BuildContext context,
  required WidgetRef ref,
  bool isWrapperAppbar = true,
  String nonPageWrapperAppbarTitle = 'Add Title',
  Function()? actionsOnPressed,
  Widget? leadingWidget,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    leading: leadingWidget,
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Text(
      isWrapperAppbar
          ? ref.watch(initialAppBarTitleStateProvider)
          : nonPageWrapperAppbarTitle,
      style: TextStyle(color: Theme.of(context).primaryColor),
    ),
    actions: [
      isWrapperAppbar
          ? coreIconButtonWidget(actionsOnPressed: actionsOnPressed)
          : Container(),
    ],
  );
}
