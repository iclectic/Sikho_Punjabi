import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/prefs/preferences_provider.dart';

/// Controls which representations of Punjabi text the learner sees. Beginners
/// rely on romanisation; the default keeps all three representations visible.
enum ScriptDisplayMode {
  gurmukhiRomanisedEnglish,
  gurmukhiEnglish,
  romanisedEnglish,
  punjabiOnly,
}

class SettingsState {
  const SettingsState({
    this.scriptDisplayMode = ScriptDisplayMode.gurmukhiRomanisedEnglish,
    this.themeMode = ThemeMode.system,
  });

  final ScriptDisplayMode scriptDisplayMode;
  final ThemeMode themeMode;

  SettingsState copyWith({
    ScriptDisplayMode? scriptDisplayMode,
    ThemeMode? themeMode,
  }) => SettingsState(
    scriptDisplayMode: scriptDisplayMode ?? this.scriptDisplayMode,
    themeMode: themeMode ?? this.themeMode,
  );
}

class SettingsNotifier extends Notifier<SettingsState> {
  static const _scriptModeKey = 'settings.script_display_mode';
  static const _themeModeKey = 'settings.theme_mode';

  @override
  SettingsState build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return SettingsState(
      scriptDisplayMode: _readEnum(
        prefs.getString(_scriptModeKey),
        ScriptDisplayMode.values,
        ScriptDisplayMode.gurmukhiRomanisedEnglish,
      ),
      themeMode: _readEnum(
        prefs.getString(_themeModeKey),
        ThemeMode.values,
        ThemeMode.system,
      ),
    );
  }

  Future<void> setScriptDisplayMode(ScriptDisplayMode mode) async {
    state = state.copyWith(scriptDisplayMode: mode);
    await ref
        .read(sharedPreferencesProvider)
        .setString(_scriptModeKey, mode.name);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = state.copyWith(themeMode: mode);
    await ref
        .read(sharedPreferencesProvider)
        .setString(_themeModeKey, mode.name);
  }

  static T _readEnum<T extends Enum>(String? raw, List<T> values, T fallback) {
    for (final v in values) {
      if (v.name == raw) return v;
    }
    return fallback;
  }
}

final settingsProvider = NotifierProvider<SettingsNotifier, SettingsState>(
  SettingsNotifier.new,
);
