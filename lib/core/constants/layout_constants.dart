import 'package:flutter/material.dart';

abstract class LayoutConstants {
  // ************* Sized ************* //
  static const noneSize = 0.0;
  static const tinySize = 2.0;
  static const lowSize = 4.0;
  static const defaultSize = 8.0;
  static const centralSize = 12.0;
  static const midSize = 16.0;
  static const highSize = 24.0;
  static const largeSize = 32.0;
  static const maxSize = 48.0;
  static const ultraSize = 64.0;

  // ************* All Padding ************* //
  static const tinyAllPadding = EdgeInsets.all(tinySize);
  static const lowAllPadding = EdgeInsets.all(lowSize);
  static const defaultAllPadding = EdgeInsets.all(defaultSize);
  static const centralAllPadding = EdgeInsets.all(centralSize);
  static const midAllPadding = EdgeInsets.all(midSize);
  static const highAllPadding = EdgeInsets.all(highSize);
  static const largeAllPadding = EdgeInsets.all(largeSize);
  static const maxAllPadding = EdgeInsets.all(maxSize);
  static const ultraAllPadding = EdgeInsets.all(ultraSize);

  // ************* Vertical Padding ************* //
  static const tinyVerticalPadding = EdgeInsets.symmetric(vertical: tinySize);
  static const lowVerticalPadding = EdgeInsets.symmetric(vertical: lowSize);
  static const defaultVerticalPadding = EdgeInsets.symmetric(vertical: defaultSize);
  static const centralVerticalPadding = EdgeInsets.symmetric(vertical: centralSize);
  static const midVerticalPadding = EdgeInsets.symmetric(vertical: midSize);
  static const highVerticalPadding = EdgeInsets.symmetric(vertical: highSize);
  static const largeVerticalPadding = EdgeInsets.symmetric(vertical: largeSize);
  static const maxVerticalPadding = EdgeInsets.symmetric(vertical: maxSize);
  static const ultraVerticalPadding = EdgeInsets.symmetric(vertical: ultraSize);

  // ************* Horizontal Padding ************* //
  static const tinyHorizontalPadding = EdgeInsets.symmetric(horizontal: tinySize);
  static const lowHorizontalPadding = EdgeInsets.symmetric(horizontal: lowSize);
  static const defaultHorizontalPadding = EdgeInsets.symmetric(horizontal: defaultSize);
  static const centralHorizontalPadding = EdgeInsets.symmetric(horizontal: centralSize);
  static const midHorizontalPadding = EdgeInsets.symmetric(horizontal: midSize);
  static const highHorizontalPadding = EdgeInsets.symmetric(horizontal: highSize);
  static const largeHorizontalPadding = EdgeInsets.symmetric(horizontal: largeSize);
  static const maxHorizontalPadding = EdgeInsets.symmetric(horizontal: maxSize);
  static const ultraHorizontalPadding = EdgeInsets.symmetric(horizontal: ultraSize);

  // ************* Horizontal Padding ************* //
  static const buttonPadding = EdgeInsets.symmetric(horizontal: largeSize, vertical: midSize);

  // ************* Empty Height ************* //
  static const tinyEmptyHeight = SizedBox(height: tinySize);
  static const lowEmptyHeight = SizedBox(height: lowSize);
  static const defaultEmptyHeight = SizedBox(height: defaultSize);
  static const centralEmptyHeight = SizedBox(height: centralSize);
  static const midEmptyHeight = SizedBox(height: midSize);
  static const highEmptyHeight = SizedBox(height: highSize);
  static const largeEmptyHeight = SizedBox(height: largeSize);
  static const maxEmptyHeight = SizedBox(height: maxSize);

  // ************* Empty Width ************* //
  static const tinyEmptyWidth = SizedBox(width: tinySize);
  static const lowEmptyWidth = SizedBox(width: lowSize);
  static const defaultEmptyWidth = SizedBox(width: defaultSize);
  static const centralEmptyWidth = SizedBox(width: centralSize);
  static const midEmptyWidth = SizedBox(width: midSize);
  static const highEmptyWidth = SizedBox(width: highSize);
  static const largeEmptyWidth = SizedBox(width: largeSize);
  static const maxEmptyWidth = SizedBox(width: maxSize);

  // ************* Radius ************* //
  static const lowRadius = 5.0;
  static const defaultRadius = 10.0;
  static const highRadius = 15.0;
  static const maxRadius = 30.0;

  // ************* Circular Radius ************* //
  static const defaultButtonBorder = BorderRadius.all(Radius.circular(defaultRadius));
  static const highButtonBorder = BorderRadius.all(Radius.circular(highRadius));
  static const maxButtonBorder = BorderRadius.all(Radius.circular(maxRadius));

  // ************* Elevations ************* //
  static const noneElevation = 0.0;
  static const lowElevation = 2.0;
  static const midElevation = 4.0;
  static const highElevation = 6.0;
  static const maxElevation = 8.0;

  // ************* Ratio's ************* //
  static const widescreenRatio = 5 / 4;
  static const fullScreenRatio = 9 / 16;
}
