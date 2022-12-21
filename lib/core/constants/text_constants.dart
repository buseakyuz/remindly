import 'package:flutter/material.dart';

abstract class TextConstants {
  // ************* Sized ************* //
  static const tinySize = 10.0;
  static const lowSize = 12.0;
  static const defaultSize = 14.0;
  static const centralSize = 16.0;
  static const midSize = 18.0;
  static const highSize = 20.0;
  static const largeSize = 24.0;
  static const maxSize = 32.0;

  // ************* TextStyles ************* //

  static const TextStyle appTitleTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle profileCountTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  static const TextStyle profileCountDescTextStyle = TextStyle(fontSize: 12);

  static const TextStyle profileUsernameTextStyle = TextStyle(
    fontSize: 12,
  );

  static const TextStyle postDescriptionTextStyle = TextStyle(
    fontSize: 10,
  );

  static const TextStyle postDateTextStyle = TextStyle(fontSize: 10, fontWeight: FontWeight.bold);

  static const TextStyle dropdownTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
  static const TextStyle actionTextStyle = TextStyle(fontWeight: FontWeight.bold);
}
