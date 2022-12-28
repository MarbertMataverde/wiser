import 'package:flutter_riverpod/flutter_riverpod.dart';

// onboarding state provider
final onBoardingInitialPageProviderState = StateProvider<int>((ref) => 0);

// authentication state provider
final authenticatingStateProvider = StateProvider<bool>((ref) => false);
