import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/helpers/hex_color.dart';
import 'app_colors.dart';

class ThemeStyles {
  // Global
  static final TextStyle fontStyle = GoogleFonts.poppins();
  static final TextTheme fontTheme = GoogleFonts.poppinsTextTheme();
  static Color get primaryColor => HexColor(AppHexColors.PRIMARY_COLOR);
  static Color get secondaryColor => HexColor(AppHexColors.SECONDARY_COLOR);
  static Color get errorColor => HexColor(AppHexColors.ERROR_COLOR);
  static Color get blackColor => HexColor(AppHexColors.BLACK_COLOR);
  // DARK THEME

  static Color get darkBackground => HexColor(AppHexColors.DARK_THEME_BACKGROUND);
  static Color get darkLayer => HexColor(AppHexColors.DARK_THEME_LAYER);
  static Color get darkLabel => HexColor(AppHexColors.DARK_THEME_LABEL);
  static Color get darkTitleText => HexColor(AppHexColors.DARK_THEME_TITLE_TEXT);
  static Color get darkBodyText => HexColor(AppHexColors.DARK_THEME_BODY_TEXT);

  static Color get lightBackground => HexColor(AppHexColors.LIGHT_THEME_BACKGROUND);
  static Color get lightLayer => HexColor(AppHexColors.LIGHT_THEME_LAYER);
  static Color get lightLabel => HexColor(AppHexColors.LIGHT_THEME_LABEL);
  static Color get lightTitleText => HexColor(AppHexColors.LIGHT_THEME_TITLE_TEXT);
  static Color get lightBodyText => HexColor(AppHexColors.LIGHT_THEME_BODY_TEXT);

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: darkBackground,
    colorScheme: _colorSchemeDark,
    shadowColor: darkLabel,
    primaryColor: primaryColor,
    brightness: Brightness.dark,
    focusColor: primaryColor,
    indicatorColor: primaryColor,
    listTileTheme: ListTileThemeData(textColor: darkBodyText),
    tabBarTheme: TabBarTheme(labelColor: darkTitleText),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: darkBodyText.withOpacity(0.4), width: 2),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(cursorColor: primaryColor),
    appBarTheme: AppBarTheme(
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark),
        titleTextStyle: fontStyle.copyWith(color: darkTitleText, fontWeight: FontWeight.bold, fontSize: 18),
        iconTheme: IconThemeData(color: darkTitleText),
        actionsIconTheme: IconThemeData(color: darkTitleText),
        backgroundColor: darkBackground,
        foregroundColor: darkTitleText,
        centerTitle: false),
    primaryTextTheme: fontTheme.copyWith(
      headline6: fontStyle.copyWith(
        color: darkTitleText,
      ),
    ),
    textTheme: fontTheme
        .copyWith(
          bodyText1: fontStyle.copyWith(color: darkBodyText),
          bodyText2: fontStyle.copyWith(color: darkBodyText),
          headline1: fontStyle.copyWith(color: darkTitleText),
          headline2: fontStyle.copyWith(color: darkTitleText),
          headline3: fontStyle.copyWith(color: darkTitleText),
          headline4: fontStyle.copyWith(color: darkTitleText),
          headline5: fontStyle.copyWith(color: darkTitleText),
          headline6: fontStyle.copyWith(color: darkTitleText),
        )
        .apply(bodyColor: darkTitleText),
    cardColor: darkLayer,
    backgroundColor: darkBackground,
    dialogBackgroundColor: darkLayer,
  );

  // LIGHT THEME

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: lightBackground,
    primaryColor: primaryColor,
    colorScheme: _colorSchemeLight,
    focusColor: primaryColor,
    indicatorColor: primaryColor,
    listTileTheme: ListTileThemeData(textColor: lightBodyText),
    tabBarTheme: TabBarTheme(labelColor: lightTitleText),
    progressIndicatorTheme: ProgressIndicatorThemeData(
        color: primaryColor,
        linearTrackColor: primaryColor.withOpacity(0.5),
        circularTrackColor: primaryColor.withOpacity(0.5),
        refreshBackgroundColor: primaryColor),
    textSelectionTheme: TextSelectionThemeData(cursorColor: primaryColor),
    shadowColor: lightLabel,
    brightness: Brightness.light,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: lightBodyText.withOpacity(0.4), width: 2),
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
        titleTextStyle: fontStyle.copyWith(color: lightTitleText, fontWeight: FontWeight.bold, fontSize: 16),
        iconTheme: IconThemeData(color: lightTitleText),
        actionsIconTheme: IconThemeData(color: lightTitleText),
        backgroundColor: lightBackground,
        foregroundColor: lightTitleText,
        centerTitle: false),
    primaryTextTheme: fontTheme.copyWith(
      headline6: fontStyle.copyWith(
        color: lightTitleText,
      ),
    ),
    textTheme: fontTheme
        .copyWith(
          bodyText1: fontStyle.copyWith(color: lightBodyText),
          bodyText2: fontStyle.copyWith(color: lightBodyText),
          headline1: fontStyle.copyWith(color: lightTitleText),
          headline2: fontStyle.copyWith(color: lightTitleText),
          headline3: fontStyle.copyWith(color: lightTitleText),
          headline4: fontStyle.copyWith(color: lightTitleText),
          headline5: fontStyle.copyWith(color: lightTitleText),
          headline6: fontStyle.copyWith(color: lightTitleText),
        )
        .apply(bodyColor: lightTitleText),
    cardColor: lightLayer,
    backgroundColor: lightBackground,
    dialogBackgroundColor: lightLayer,
  );

  static get _colorSchemeLight => ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: primaryColor,
      secondary: secondaryColor,
      onSecondary: secondaryColor,
      error: errorColor,
      onError: errorColor,
      background: lightBackground,
      onBackground: lightBackground,
      surface: lightLabel,
      onSurface: lightLabel);

  static get _colorSchemeDark => ColorScheme(
      brightness: Brightness.dark,
      primary: primaryColor,
      onPrimary: primaryColor,
      secondary: secondaryColor,
      onSecondary: secondaryColor,
      error: errorColor,
      onError: errorColor,
      background: darkBackground,
      onBackground: darkBackground,
      surface: darkLabel,
      onSurface: darkLabel);
}
