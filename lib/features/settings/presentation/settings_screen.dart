import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_tokens.dart';
import '../domain/settings.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final notifier = ref.read(settingsProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: AppSpacing.screenPadding,
        children: [
          Text(
            'Punjabi text display',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: AppSpacing.sm),
          RadioGroup<ScriptDisplayMode>(
            groupValue: settings.scriptDisplayMode,
            onChanged: (mode) {
              if (mode != null) notifier.setScriptDisplayMode(mode);
            },
            child: Column(
              children: [
                for (final mode in ScriptDisplayMode.values)
                  RadioListTile<ScriptDisplayMode>(
                    value: mode,
                    title: Text(switch (mode) {
                      ScriptDisplayMode.gurmukhiRomanisedEnglish =>
                        'Gurmukhi + Romanisation + English',
                      ScriptDisplayMode.gurmukhiEnglish => 'Gurmukhi + English',
                      ScriptDisplayMode.romanisedEnglish =>
                        'Romanisation + English',
                      ScriptDisplayMode.punjabiOnly => 'Punjabi only',
                    }),
                    contentPadding: EdgeInsets.zero,
                  ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Text('Theme', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          RadioGroup<ThemeMode>(
            groupValue: settings.themeMode,
            onChanged: (mode) {
              if (mode != null) notifier.setThemeMode(mode);
            },
            child: Column(
              children: [
                for (final mode in ThemeMode.values)
                  RadioListTile<ThemeMode>(
                    value: mode,
                    title: Text(switch (mode) {
                      ThemeMode.system => 'System',
                      ThemeMode.light => 'Light',
                      ThemeMode.dark => 'Dark',
                    }),
                    contentPadding: EdgeInsets.zero,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
