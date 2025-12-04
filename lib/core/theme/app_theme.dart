import 'package:challenge_crypto_tracker_lite/core/core.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme =>
      ThemeData.from(
        colorScheme: AppColorScheme.dark,
        useMaterial3: true,
      ).copyWith(
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.surface,
          foregroundColor: AppColors.onSurface,
          elevation: 0,
        ),
        iconTheme: const IconThemeData(color: AppColors.onSurface),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.primary,
        ),
        dividerTheme: const DividerThemeData(color: AppColors.outline),
      );
}
