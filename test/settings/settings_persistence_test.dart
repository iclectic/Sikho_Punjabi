import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sikho_punjabi/core/prefs/preferences_provider.dart';
import 'package:sikho_punjabi/features/settings/domain/settings.dart';

/// Settings must survive an app restart — simulated by building a fresh
/// container over the same persisted shared_preferences values.
void main() {
  test('script display mode persists across container restarts', () async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'settings.script_display_mode',
      ScriptDisplayMode.romanisedEnglish.name,
    );

    // A new container = a new "app launch" reading the same prefs.
    final container = ProviderContainer(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(
          await SharedPreferences.getInstance(),
        ),
      ],
    );
    addTearDown(container.dispose);

    expect(
      container.read(settingsProvider).scriptDisplayMode,
      ScriptDisplayMode.romanisedEnglish,
    );
  });

  test('writing through the notifier persists to shared_preferences', () async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final container = ProviderContainer(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
    );
    addTearDown(container.dispose);

    await container
        .read(settingsProvider.notifier)
        .setScriptDisplayMode(ScriptDisplayMode.punjabiOnly);

    expect(
      prefs.getString('settings.script_display_mode'),
      ScriptDisplayMode.punjabiOnly.name,
    );
  });
}
