import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wiser/core/constant.dart';
import 'package:wiser/features/pageview/view/view_page_wrapper.dart';

BottomNavigationBar bottomNavigationBar(
    {required List<BottomNavigationBarItem> itemList,
    required WidgetRef ref,
    required PageController pageController}) {
  return BottomNavigationBar(
      showSelectedLabels: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
      showUnselectedLabels: false,
      currentIndex: ref.watch(initialNavBarItemIdexStateProvider),
      unselectedItemColor: Constant.bodyColor,
      selectedItemColor: Constant.primaryColor,
      selectedIconTheme: const IconThemeData(color: Constant.primaryColor),
      onTap: (value) =>
          onButtonPressed(value, ref: ref, pageController: pageController),
      items: itemList);
}

void onButtonPressed(int index,
    {required WidgetRef ref, required PageController pageController}) {
  ref
      .read(initialNavBarItemIdexStateProvider.notifier)
      .update((state) => index);
  pageController.jumpToPage(
    ref.read(initialNavBarItemIdexStateProvider),
  );
}
