import 'package:flutter/material.dart';

/// Design tokens for Sikho Punjabi.
///
/// All spacing, radii, and animation durations used across the app should come
/// from these tokens rather than ad-hoc literals.
abstract final class AppSpacing {
  static const double xxs = 2;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;
  static const double xxxl = 48;

  static const EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: md,
  );
  static const EdgeInsets cardPadding = EdgeInsets.all(lg);
}

abstract final class AppRadius {
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;

  static final BorderRadius cardRadius = BorderRadius.circular(lg);
}

abstract final class AppDurations {
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
}

/// Brand palette. Kept restrained: a deep indigo primary for calm/focus and a
/// warm saffron accent referencing Punjabi visual culture.
abstract final class AppColors {
  static const Color seed = Color(0xFF3D5A80);
  static const Color accent = Color(0xFFE8963C);

  static const Color success = Color(0xFF3E8853);
  static const Color warning = Color(0xFFB97A1D);
  static const Color error = Color(0xFFBF4040);

  /// Tag used for content that has not yet been reviewed by a native speaker.
  static const Color unverified = Color(0xFF8A6D1D);
}
