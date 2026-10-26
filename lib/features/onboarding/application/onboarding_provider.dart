import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/prefs/preferences_provider.dart';

/// Tracks whether the learner has finished first-run onboarding.
class OnboardingNotifier extends Notifier<bool> {
  static const _key = 'onboarding.completed';

  @override
  bool build() => ref.watch(sharedPreferencesProvider).getBool(_key) ?? false;

  Future<void> complete() async {
    state = true;
    await ref.read(sharedPreferencesProvider).setBool(_key, true);
  }
}

final onboardingCompletedProvider = NotifierProvider<OnboardingNotifier, bool>(
  OnboardingNotifier.new,
);
