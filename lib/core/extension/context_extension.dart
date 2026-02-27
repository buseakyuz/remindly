import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;

  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

extension PaddingExtension on BuildContext {
  EdgeInsets get lowPaddingAll => const EdgeInsets.all(8);
  EdgeInsets get defaultPaddingAll => const EdgeInsets.all(16);
}
