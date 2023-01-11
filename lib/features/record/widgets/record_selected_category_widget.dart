import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wiser/features/record/view/new_record_view.dart';

recordSelectedCategoryWidget({
  required WidgetRef ref,
  required BuildContext context,
  required String categoryTitle,
  required IconData categoryIconData,
  required Color categoryIconBackgroundColor,
}) {
  ref
      .read(selectedCategoryTitleStateProvider.notifier)
      .update((state) => categoryTitle);
  ref
      .read(selectedCategoryIconDataStateProvider.notifier)
      .update((state) => categoryIconData);
  ref
      .read(selectedCategoryColorStateProvider.notifier)
      .update((state) => categoryIconBackgroundColor);
  Navigator.pop(context);
}
