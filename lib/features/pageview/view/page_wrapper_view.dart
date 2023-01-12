import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wiser/core/widgets/core_appbar_widget.dart';
import 'package:wiser/features/authentication/login/services/sign_out_services.dart';

import 'package:wiser/features/pageview/widgets/pageview_bottom_navigation_bar_widget.dart';
import 'package:wiser/features/pageview/widgets/pageview_bottom_navigation_bar_item_widget.dart';
import 'package:wiser/features/pageview/widgets/pageview_page_list_widget.dart';

final initialNavBarItemIdexStateProvider = StateProvider<int>((ref) => 0);

final initialAppBarTitleStateProvider =
    StateProvider<String>((ref) => 'Dashboard');

class PageViewWrapperView extends ConsumerStatefulWidget {
  const PageViewWrapperView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<PageViewWrapperView> {
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
      appBar: coreAppBarWidget(
        context: context,
        ref: ref,
        actionsOnPressed: () {
          signOut();
        },
      ),
      body: SafeArea(
        child: PageView(
          physics: const AlwaysScrollableScrollPhysics(),
          pageSnapping: true,
          onPageChanged: (value) {
            ref
                .read(initialNavBarItemIdexStateProvider.notifier)
                .update((state) => value);
            if (value == 0) {
              ref.invalidate(initialAppBarTitleStateProvider);
            } else if (value == 1) {
              ref
                  .read(initialAppBarTitleStateProvider.notifier)
                  .update((state) => 'Records');
            } else if (value == 2) {
              ref
                  .read(initialAppBarTitleStateProvider.notifier)
                  .update((state) => 'Budget');
            } else if (value == 3) {
              ref
                  .read(initialAppBarTitleStateProvider.notifier)
                  .update((state) => 'Accounts');
            } else if (value == 4) {
              ref
                  .read(initialAppBarTitleStateProvider.notifier)
                  .update((state) => 'Wisedar');
            }
          },
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
            iconData: Iconsax.receipt_text,
          ),
          pageviewBottomNavigationBarItemWidget(
            iconData: Iconsax.wallet_money,
          ),
          pageviewBottomNavigationBarItemWidget(
            iconData: Iconsax.card,
          ),
          pageviewBottomNavigationBarItemWidget(
            iconData: Iconsax.calendar_2,
          ),
        ],
      ),
    );
  }
}
