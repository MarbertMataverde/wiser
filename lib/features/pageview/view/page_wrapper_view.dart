import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import 'package:wiser/features/pageview/widgets/pageview_bottom_navigation_bar_widget.dart';
import 'package:wiser/features/pageview/widgets/pageview_bottom_navigation_bar_item_widget.dart';
import 'package:wiser/features/pageview/widgets/pageview_page_list_widget.dart';

final initialNavBarItemIdexStateProvider = StateProvider((ref) => 0);

class PageViewWrapper extends ConsumerStatefulWidget {
  const PageViewWrapper({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<PageViewWrapper> {
  final User? user = FirebaseAuth.instance.currentUser;

  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(
        initialPage: ref.read(initialNavBarItemIdexStateProvider));
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: PageView(
          physics: const AlwaysScrollableScrollPhysics(),
          pageSnapping: true,
          onPageChanged: (value) => ref
              .read(initialNavBarItemIdexStateProvider.notifier)
              .update((state) => value),
          controller: pageController,
          children: pageList,
        ),
      ),
      bottomNavigationBar: pageviewBottomNavigationBarWidget(
        ref: ref,
        pageController: pageController,
        itemList: [
          pageviewBottomNavigationBarItemWidget(
            iconData: Iconsax.home_1,
          ),
          pageviewBottomNavigationBarItemWidget(
            iconData: Iconsax.wallet_money,
          ),
          pageviewBottomNavigationBarItemWidget(
            iconData: Iconsax.receipt_text,
          ),
          pageviewBottomNavigationBarItemWidget(
            iconData: Iconsax.calendar_2,
          ),
        ],
      ),
    );
  }
}
