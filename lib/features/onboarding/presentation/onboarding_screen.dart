import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/theme/app_tokens.dart';
import '../../settings/domain/settings.dart';
import '../application/onboarding_provider.dart';

/// First-run onboarding: what the app teaches, how it works, and the
/// learner's preferred script display. Everything here is changeable later
/// in Settings — nothing is a commitment.
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _pageController = PageController();
  int _page = 0;

  static const _pageCount = 3;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _finish() async {
    await ref.read(onboardingCompletedProvider.notifier).complete();
    if (mounted) context.go(AppRoutes.learn);
  }

  @override
  Widget build(BuildContext context) {
    final isLast = _page == _pageCount - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(onPressed: _finish, child: const Text('Skip')),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (i) => setState(() => _page = i),
                children: const [
                  _WelcomePage(),
                  _HowItWorksPage(),
                  _ScriptPreferencePage(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < _pageCount; i++)
                  AnimatedContainer(
                    duration: AppDurations.fast,
                    margin: const EdgeInsets.all(AppSpacing.xs),
                    width: i == _page ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: i == _page
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.outlineVariant,
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: AppSpacing.screenPadding,
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: isLast
                      ? _finish
                      : () => _pageController.nextPage(
                          duration: AppDurations.normal,
                          curve: Curves.easeOut,
                        ),
                  child: Text(isLast ? 'Start learning' : 'Continue'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PageShell extends StatelessWidget {
  const _PageShell({
    required this.icon,
    required this.title,
    required this.child,
  });

  final IconData icon;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.xl),
          Icon(icon, size: 48, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: AppSpacing.lg),
          Text(title, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: AppSpacing.lg),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class _WelcomePage extends StatelessWidget {
  const _WelcomePage();

  @override
  Widget build(BuildContext context) {
    return _PageShell(
      icon: Icons.school_outlined,
      title: 'Learn Punjabi properly',
      child: Text(
        'Sikho Punjabi is a structured course that takes you from no Punjabi '
        'to everyday conversations — not a phrasebook.\n\n'
        'Every lesson shows you Gurmukhi, a romanised spelling, and the '
        'English meaning, then explains how the sentence is actually built '
        'and when people really say it.',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
      ),
    );
  }
}

class _HowItWorksPage extends StatelessWidget {
  const _HowItWorksPage();

  @override
  Widget build(BuildContext context) {
    return _PageShell(
      icon: Icons.route_outlined,
      title: 'How it works',
      child: Column(
        children: [
          for (final (icon, text) in [
            (
              Icons.menu_book_outlined,
              'Short lessons that build on each other, 10–15 minutes each.',
            ),
            (
              Icons.fitness_center_outlined,
              'Exercises that check real understanding, not just memory.',
            ),
            (
              Icons.style_outlined,
              'Flashcards review words you\'ve met, scheduled at the right time.',
            ),
            (
              Icons.translate_outlined,
              'Learn the Gurmukhi script gradually, alongside speaking.',
            ),
          ])
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.lg),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(icon, size: 22),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Text(
                      text,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _ScriptPreferencePage extends ConsumerWidget {
  const _ScriptPreferencePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    return _PageShell(
      icon: Icons.translate,
      title: 'How should Punjabi appear?',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'You don\'t need to read Gurmukhi to start speaking. Pick what '
            'works for you — you can change it anytime in Settings.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.md),
          RadioGroup<ScriptDisplayMode>(
            groupValue: settings.scriptDisplayMode,
            onChanged: (mode) {
              if (mode != null) {
                ref.read(settingsProvider.notifier).setScriptDisplayMode(mode);
              }
            },
            child: Column(
              children: [
                for (final mode in ScriptDisplayMode.values)
                  RadioListTile<ScriptDisplayMode>(
                    value: mode,
                    title: Text(switch (mode) {
                      ScriptDisplayMode.gurmukhiRomanisedEnglish =>
                        'Everything (recommended)',
                      ScriptDisplayMode.gurmukhiEnglish => 'Gurmukhi + English',
                      ScriptDisplayMode.romanisedEnglish =>
                        'Romanisation + English',
                      ScriptDisplayMode.punjabiOnly => 'Punjabi only',
                    }),
                    subtitle: Text(switch (mode) {
                      ScriptDisplayMode.gurmukhiRomanisedEnglish =>
                        'Best for beginners',
                      _ => '',
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
