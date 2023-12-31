import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData _themeLight = ThemeData.light(useMaterial3: true);

ThemeData themeLight = _themeLight.copyWith(
  // canvasColor: Colors.white,
  colorScheme: _schemeLight(_themeLight.colorScheme),
  textTheme: _textLight(_themeLight.textTheme),
  elevatedButtonTheme: ElevatedButtonThemeData(style: _elevButtonLight),
  textButtonTheme: TextButtonThemeData(style: _textButtonLight),
  appBarTheme: _appBarLight(_themeLight.appBarTheme),
  bottomAppBarTheme: _bottomAppBarLight(_themeLight.bottomAppBarTheme),
  inputDecorationTheme: _inputDecorLight(_themeLight.inputDecorationTheme),
);

ColorScheme _schemeLight(ColorScheme base) {
  return base.copyWith(
    secondaryContainer: AppColors.white,
    tertiaryContainer: AppColors.greyLighter,
    onTertiary: AppColors.textSecondary,
    background: AppColors.greyLight,
    primary: AppColors.blue,
    error: AppColors.error,
  );
}

TextTheme _textLight(TextTheme base) {
  return base.copyWith(
    bodyMedium: base.bodyMedium!.copyWith(
      fontSize: 16,
      height: 19.2 / 16,
      fontFamily: 'SF',
    ),
    bodyLarge: base.bodyLarge!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 19.2 / 16,
      fontFamily: 'SF',
      color: AppColors.textSecondary,
    ),
    bodySmall: base.bodySmall!.copyWith(
      fontSize: 16,
      height: 19.2 / 16,
      fontFamily: 'SF',
      color: AppColors.textSecondary,
    ),
    titleMedium: base.titleMedium!.copyWith(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      height: 26.4 / 22,
      fontFamily: 'SF',
    ),
    titleLarge: base.titleLarge!.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      height: 36 / 30,
      fontFamily: 'SF',
    ),
    labelMedium: base.labelMedium!.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 16.8 / 14,
      color: AppColors.textSecondary,
      fontFamily: 'SF',
    ),
    labelLarge: base.labelLarge!.copyWith(
      fontSize: 16,
      height: 17.6 / 16,
      fontFamily: 'SF',
      letterSpacing: 0.75,
    ),
  );
}

ButtonStyle _elevButtonLight = ElevatedButton.styleFrom(
  backgroundColor: AppColors.blue,
  foregroundColor: AppColors.white,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  textStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 17.6 / 16,
    letterSpacing: 0.1,
    fontFamily: 'SF',
  ),
);

ButtonStyle _textButtonLight = TextButton.styleFrom(
  foregroundColor: AppColors.blue,
  textStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 16.8 / 14,
    fontFamily: 'SF',
  ),
  padding: EdgeInsets.zero,
);

AppBarTheme _appBarLight(AppBarTheme base) {
  return base.copyWith(
    backgroundColor: AppColors.white,
    foregroundColor: AppColors.black,
    elevation: 0.0,
    centerTitle: true,
    titleTextStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      height: 21.6 / 18,
      fontFamily: 'SF',
      color: AppColors.black,
    ),
    surfaceTintColor: AppColors.white,
  );
}

BottomAppBarTheme _bottomAppBarLight(BottomAppBarTheme base) {
  return base.copyWith(
    color: AppColors.white,
    elevation: 3,
    surfaceTintColor: AppColors.white,
    shadowColor: AppColors.black,
  );
}

InputDecorationTheme _inputDecorLight(InputDecorationTheme base) {
  return base.copyWith(
    // isDense: true,
    errorStyle: const TextStyle(fontSize: 0, height: 0),
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    focusedErrorBorder: InputBorder.none,
    labelStyle: const TextStyle(
      fontSize: 17,
      height: 20.4 / 17,
      fontFamily: 'SF',
      color: AppColors.textTertiary,
    ),
  );
}
