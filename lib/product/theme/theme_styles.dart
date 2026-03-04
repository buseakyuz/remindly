import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/layout_constants.dart';
import '../../core/helpers/hex_color.dart';
import 'app_colors.dart';

class ThemeStyles {
  // Global
  static final TextStyle fontStyle = GoogleFonts.comingSoon();
  static final TextTheme fontTheme = GoogleFonts.comingSoonTextTheme();
  static Color get primaryColor => HexColor(AppHexColors.primary);
  static Color get secondaryColor => HexColor(AppHexColors.secondary);
  static Color get errorColor => HexColor(AppHexColors.error);
  static Color get blackColor => HexColor(AppHexColors.black);
  // DARK THEME

  static Color get darkBackground => HexColor(AppHexColors.darkThemeBackground);
  static Color get darkLayer => HexColor(AppHexColors.darkThemeLayer);
  static Color get darkLabel => HexColor(AppHexColors.darkThemeLabel);
  static Color get darkTitleText => HexColor(AppHexColors.darkThemeTitleText);
  static Color get darkBodyText => HexColor(AppHexColors.darkThemeBodyText);

  static Color get lightBackground =>
      HexColor(AppHexColors.lightThemeBackground);
  static Color get lightLayer => HexColor(AppHexColors.lightThemeLayer);
  static Color get lightLabel => HexColor(AppHexColors.lightThemeLabel);
  static Color get lightTitleText => HexColor(AppHexColors.lightThemeTitleText);
  static Color get lightBodyText => HexColor(AppHexColors.lightThemeBodyText);

  static Color get darkBodyTextTransparent =>
      darkBodyText.withAlpha(102); // 0.4
  static Color get lightBodyTextTransparent =>
      lightBodyText.withAlpha(102); // 0.4
  static Color get primaryColorHalfTransparent =>
      primaryColor.withAlpha(128); // 0.5

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: darkBackground,
    colorScheme: _colorSchemeDark,
    shadowColor: darkLabel,
    primaryColor: primaryColor,
    brightness: Brightness.dark,
    focusColor: primaryColor,
    listTileTheme: ListTileThemeData(textColor: darkBodyText),
    tabBarTheme: TabBarThemeData(
      labelColor: darkTitleText,
      indicatorColor: primaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: darkBodyTextTransparent,
          width: LayoutConstants.tinySize,
        ),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(cursorColor: primaryColor),
    appBarTheme: AppBarTheme(
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      titleTextStyle: fontStyle.copyWith(
        color: darkTitleText,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      iconTheme: IconThemeData(color: darkTitleText),
      actionsIconTheme: IconThemeData(color: darkTitleText),
      backgroundColor: darkBackground,
      foregroundColor: darkTitleText,
      centerTitle: false,
    ),
    primaryTextTheme: fontTheme.copyWith(
      titleLarge: fontStyle.copyWith(color: darkTitleText),
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
    tabBarTheme: TabBarThemeData(
      labelColor: lightTitleText,
      indicatorColor: primaryColor,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: primaryColor,
      linearTrackColor: primaryColorHalfTransparent,
      circularTrackColor: primaryColorHalfTransparent,
      refreshBackgroundColor: primaryColor,
    ),
    textSelectionTheme: TextSelectionThemeData(cursorColor: primaryColor),
    shadowColor: lightLabel,
    brightness: Brightness.light,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: lightBodyTextTransparent,
          width: LayoutConstants.tinySize,
        ),
        borderRadius: BorderRadius.circular(LayoutConstants.defaultRadius),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: LayoutConstants.tinySize),
        borderRadius: BorderRadius.circular(LayoutConstants.defaultRadius),
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
        color: lightTitleText,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      iconTheme: IconThemeData(color: lightTitleText),
      actionsIconTheme: IconThemeData(color: lightTitleText),
      backgroundColor: lightBackground,
      foregroundColor: lightTitleText,
      centerTitle: false,
    ),
    primaryTextTheme: fontTheme.copyWith(
      titleLarge: fontStyle.copyWith(color: lightTitleText),
    ),
    textTheme: fontTheme.apply(bodyColor: lightTitleText),
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
    onSurface: lightTitleText,
  );

  static ColorScheme get _colorSchemeDark => ColorScheme(
    brightness: Brightness.dark,
    primary: primaryColor,
    onPrimary: Colors.white,
    secondary: secondaryColor,
    onSecondary: Colors.white,
    error: errorColor,
    onError: Colors.white,
    surface: darkBackground,
    onSurface: darkTitleText,
  );
}
