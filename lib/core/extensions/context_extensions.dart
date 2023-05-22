import 'package:flutter/material.dart';

extension ContextX on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  TextStyle get labelS => textTheme.labelSmall ?? const TextStyle();
  TextStyle get labelM => textTheme.labelMedium ?? const TextStyle();
  TextStyle get labelL => textTheme.labelLarge ?? const TextStyle();
  TextStyle get bodyS => textTheme.bodySmall ?? const TextStyle();
  TextStyle get bodyM => textTheme.bodyMedium ?? const TextStyle();
  TextStyle get bodyL => _largeStyle(textTheme.bodyLarge) ?? const TextStyle();
  TextStyle get titleS => textTheme.titleSmall ?? const TextStyle();
  TextStyle get titleM =>
      _largeStyle(textTheme.titleMedium) ?? const TextStyle();
  TextStyle get titleL =>
      _largeStyle(textTheme.titleLarge) ?? const TextStyle();
  TextStyle get headlineS =>
      _largeStyle(textTheme.headlineSmall) ?? const TextStyle();
  TextStyle get headlineM =>
      _largeStyle(textTheme.headlineMedium) ?? const TextStyle();
  TextStyle get headlineL =>
      _largeStyle(textTheme.headlineLarge) ?? const TextStyle();
  TextStyle get displayS =>
      _largeStyle(textTheme.displaySmall) ?? const TextStyle();
  TextStyle get displayM =>
      _largeStyle(textTheme.displayMedium) ?? const TextStyle();
  TextStyle get displayL =>
      _largeStyle(textTheme.displayLarge) ?? const TextStyle();

  TextStyle? _largeStyle(TextStyle? style) =>
      style?.copyWith(color: Colors.black);
}
