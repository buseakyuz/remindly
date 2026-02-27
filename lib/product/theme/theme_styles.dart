import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/helpers/hex_color.dart';
import 'app_colors.dart';

class ThemeStyles {
  // Global
  static final TextStyle fontStyle = GoogleFonts.caveat();
  static final TextTheme fontTheme = GoogleFonts.caveatTextTheme();
  static Color get primaryColor => HexColor(AppHexColors.primary);
  static Color get secondaryColor => HexColor(AppHexColors.secondary);
  static Color get errorColor => HexColor(AppHexColors.error);
  static Color get blackColor => HexColor(AppHexColors.black);
  // DARK THEME

  static Color get darkBackground =>
      HexColor(AppHexColors.darkThemeBackground);
  static Color get darkLayer => HexColor(AppHexColors.darkThemeLayer);
  static Color get darkLabel => HexColor(AppHexColors.darkThemeLabel);
  static Color get darkTitleText =>
      HexColor(AppHexColors.darkThemeTitleText);
  static Color get darkBodyText => HexColor(AppHexColors.darkThemeBodyText);

  static Color get lightBackground =>
      HexColor(AppHexColors.lightThemeBackground);
  static Color get lightLayer => HexColor(AppHexColors.lightThemeLayer);
  static Color get lightLabel => HexColor(AppHexColors.lightThemeLabel);
  static Color get lightTitleText =>
      HexColor(AppHexColors.lightThemeTitleText);
  static Color get lightBodyText =>
      HexColor(AppHexColors.lightThemeBodyText);

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: darkBackground,
    colorScheme: _colorSchemeDark,
    shadowColor: darkLabel,
    primaryColor: primaryColor,
    brightness: Brightness.dark,
    focusColor: primaryColor,
    listTileTheme: ListTileThemeData(textColor: darkBodyText),
    tabBarTheme: TabBarThemeData(labelColor: darkTitleText, indicatorColor: primaryColor),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: darkBodyText.withAlpha((0.4 * 255).toInt()), width: 2),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(cursorColor: primaryColor),
    appBarTheme: AppBarTheme(
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark),
        titleTextStyle: fontStyle.copyWith(
            color: darkTitleText, fontWeight: FontWeight.bold, fontSize: 18),
        iconTheme: IconThemeData(color: darkTitleText),
        actionsIconTheme: IconThemeData(color: darkTitleText),
        backgroundColor: darkBackground,
        foregroundColor: darkTitleText,
        centerTitle: false),
    primaryTextTheme: fontTheme.copyWith(
      titleLarge: fontStyle.copyWith(
        color: darkTitleText,
      ),
    ),
    textTheme: fontTheme.apply(bodyColor: darkTitleText),
    cardColor: darkLayer,
    dialogTheme: DialogThemeData(backgroundColor: darkLayer),
  );

  // LIGHT THEME

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: lightBackground,
    primaryColor: primaryColor,
    colorScheme: _colorSchemeLight,
    focusColor: primaryColor,
    listTileTheme: ListTileThemeData(textColor: lightBodyText),
    tabBarTheme: TabBarThemeData(labelColor: lightTitleText, indicatorColor: primaryColor),
    progressIndicatorTheme: ProgressIndicatorThemeData(
        color: primaryColor,
        linearTrackColor: primaryColor.withAlpha((0.5 * 255).toInt()),
        circularTrackColor: primaryColor.withAlpha((0.5 * 255).toInt()),
        refreshBackgroundColor: primaryColor),
    textSelectionTheme: TextSelectionThemeData(cursorColor: primaryColor),
    shadowColor: lightLabel,
    brightness: Brightness.light,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: lightBodyText.withAlpha((0.4 * 255).toInt()), width: 2),
          borderRadius: BorderRadius.circular(10)),
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    appBarTheme: AppBarTheme(
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        titleTextStyle: fontStyle.copyWith(
            color: lightTitleText, fontWeight: FontWeight.bold, fontSize: 16),
        iconTheme: IconThemeData(color: lightTitleText),
        actionsIconTheme: IconThemeData(color: lightTitleText),
        backgroundColor: lightBackground,
        foregroundColor: lightTitleText,
        centerTitle: false),
    primaryTextTheme: fontTheme.copyWith(
      titleLarge: fontStyle.copyWith(
        color: lightTitleText,
      ),
    ),
    textTheme: fontTheme.apply(bodyColor: lightTitleText).copyWith(),
    cardColor: lightLayer,
    dialogTheme: DialogThemeData(backgroundColor: lightLayer),
  );

  static ColorScheme get _colorSchemeLight => ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: Colors.white,
      secondary: secondaryColor,
      onSecondary: Colors.white,
      error: errorColor,
      onError: Colors.white,
      surface: lightBackground,
      onSurface: lightTitleText);

  static ColorScheme get _colorSchemeDark => ColorScheme(
      brightness: Brightness.dark,
      primary: primaryColor,
      onPrimary: Colors.white,
      secondary: secondaryColor,
      onSecondary: Colors.white,
      error: errorColor,
      onError: Colors.white,
      surface: darkBackground,
      onSurface: darkTitleText);
}
