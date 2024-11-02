import 'package:flutter/material.dart';
import '/bootstrap/helpers.dart';
import '/resources/themes/styles/color_styles.dart';
import 'package:nylo_framework/nylo_framework.dart';

/// [Text] Extensions
extension NyText on Text {
  Text setColor(
      BuildContext context, Color Function(ColorStyles color) newColor,
      {String? themeId}) {
    return copyWith(
        style: TextStyle(
            color: newColor(ThemeColor.get(context, themeId: themeId))));
  }
}

/// [BuildContext] Extensions
extension NyApp on BuildContext {
  /// Get the current theme color
  ColorStyles get color => ThemeColor.get(this);

  /// Check if the device is in dark mode
  bool get isThemeDark {
    if (this.isDeviceInDarkMode) return true;

    return ThemeProvider.controllerOf(this).currentThemeId ==
        getEnv('DARK_THEME_ID');
  }
}

/// [TextStyle] Extensions
extension NyTextStyle on TextStyle {
  TextStyle? setColor(
      BuildContext context, Color Function(ColorStyles color) newColor,
      {String? themeId}) {
    return copyWith(color: newColor(ThemeColor.get(context, themeId: themeId)));
  }
}
