import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData _themeLight = ThemeData.light();

ThemeData themeLight = _themeLight.copyWith(
  colorScheme: _schemeLight(_themeLight.colorScheme),
);

ColorScheme _schemeLight(ColorScheme base) {
  return base.copyWith(
    secondaryContainer: AppColors.white,
    tertiaryContainer: AppColors.greyLighter,
    background: AppColors.greyLight,
  );
}