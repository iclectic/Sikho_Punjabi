import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/courses/presentation/course_screen.dart';
import '../features/courses/presentation/level_screen.dart';
import '../features/courses/presentation/module_screen.dart';
import '../features/gurmukhi/presentation/gurmukhi_screen.dart';
import '../features/learn/presentation/learn_screen.dart';
import '../features/lessons/presentation/lesson_screen.dart';
import '../features/onboarding/application/onboarding_provider.dart';
import '../features/onboarding/presentation/onboarding_screen.dart';
import '../features/progress/presentation/progress_screen.dart';
import '../features/review/presentation/review_screen.dart';
import '../features/settings/presentation/settings_screen.dart';

abstract final class AppRoutes {
  static const onboarding = '/onboarding';
  static const learn = '/learn';
  static const review = '/review';
  static const gurmukhi = '/gurmukhi';
  static const progress = '/progress';
  static const settings = '/settings';
  static const course = '/learn/course';
  static String level(String levelId) => '/learn/level/$levelId';
  static String module(String moduleId) => '/learn/module/$moduleId';
  static String lesson(String lessonId) => '/learn/lesson/$lessonId';
}

final appRouterProvider = Provider<GoRouter>((ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.learn,
    redirect: (context, state) {
      final onboarded = ref.read(onboardingCompletedProvider);
      final onOnboarding = state.matchedLocation == AppRoutes.onboarding;
      if (!onboarded && !onOnboarding) return AppRoutes.onboarding;
      if (onboarded && onOnboarding) return AppRoutes.learn;
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const OnboardingScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            _AppShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.learn,
                builder: (context, state) => const LearnScreen(),
                routes: [
                  GoRoute(
                    path: 'course',
                    builder: (context, state) => const CourseScreen(),
                  ),
                  GoRoute(
                    path: 'level/:levelId',
                    builder: (context, state) =>
                        LevelScreen(levelId: state.pathParameters['levelId']!),
                  ),
                  GoRoute(
                    path: 'module/:moduleId',
                    builder: (context, state) => ModuleScreen(
                      moduleId: state.pathParameters['moduleId']!,
                    ),
                  ),
                  GoRoute(
                    path: 'lesson/:lessonId',
                    parentNavigatorKey: rootNavigatorKey,
                    builder: (context, state) => LessonScreen(
                      lessonId: state.pathParameters['lessonId']!,
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.review,
                builder: (context, state) => const ReviewScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.gurmukhi,
                builder: (context, state) => const GurmukhiScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.progress,
                builder: (context, state) => const ProgressScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.settings,
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
});

class _AppShell extends StatelessWidget {
  const _AppShell({required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            selectedIcon: Icon(Icons.school),
            label: 'Learn',
          ),
          NavigationDestination(
            icon: Icon(Icons.style_outlined),
            selectedIcon: Icon(Icons.style),
            label: 'Review',
          ),
          NavigationDestination(
            icon: Icon(Icons.translate_outlined),
            selectedIcon: Icon(Icons.translate),
            label: 'Gurmukhi',
          ),
          NavigationDestination(
            icon: Icon(Icons.insights_outlined),
            selectedIcon: Icon(Icons.insights),
            label: 'Progress',
          ),
        ],
      ),
    );
  }
}
