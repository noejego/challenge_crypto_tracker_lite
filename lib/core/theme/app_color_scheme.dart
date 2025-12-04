import 'package:challenge_crypto_tracker_lite/core/core.dart';
import 'package:flutter/material.dart';

class AppColorScheme {
  static ColorScheme get dark => const ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onSecondary,
    surface: AppColors.surface,
    onSurface: AppColors.onSurface,
    error: AppColors.error,
    onError: AppColors.onError,
    primaryContainer: AppColors.primaryContainer,
    onPrimaryContainer: AppColors.onSurface,
    secondaryContainer: AppColors.secondaryContainer,
    onSecondaryContainer: AppColors.onSurface,
    tertiary: AppColors.tertiary,
    onTertiary: AppColors.onSurface,
    tertiaryContainer: AppColors.tertiaryContainer,
    onTertiaryContainer: AppColors.onSurface,
    errorContainer: AppColors.errorContainer,
    onErrorContainer: AppColors.onErrorContainer,
    surfaceContainerHighest: AppColors.surfaceVariant,
    onSurfaceVariant: AppColors.onSurfaceVariant,
    outline: AppColors.outline,
    shadow: AppColors.shadow,
    inverseSurface: AppColors.inverseSurface,
    onInverseSurface: AppColors.onInverseSurface,
  );
}
