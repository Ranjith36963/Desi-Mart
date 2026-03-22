import 'package:flutter/material.dart';

abstract final class AppColours {
  // Brand colours
  static const Color saffron = Color(0xFFE8722A);
  static const Color green = Color(0xFF2D7A3A);
  static const Color cream = Color(0xFFFFFDF7);
  static const Color darkText = Color(0xFF1A1A1A);

  // Saffron shades
  static const Color saffronLight = Color(0xFFFFF3EB);
  static const Color saffronDark = Color(0xFFCC5F1E);

  // Green shades
  static const Color greenLight = Color(0xFFE8F5E9);
  static const Color greenDark = Color(0xFF1B5E20);

  // Neutral
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey800 = Color(0xFF424242);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // Tag colours
  static const Color tagHot = Color(0xFFE53E3E);
  static const Color tagPopular = Color(0xFFDD6B20);
  static const Color tagNew = Color(0xFF2D7A3A);
  static const Color tagValue = Color(0xFF3182CE);
  static const Color tagDeal = Color(0xFF805AD5);

  // Status
  static const Color success = Color(0xFF2D7A3A);
  static const Color error = Color(0xFFE53E3E);
  static const Color warning = Color(0xFFDD6B20);

  static Color tagColour(String tag) {
    switch (tag.toUpperCase()) {
      case 'HOT':
        return tagHot;
      case 'POPULAR':
        return tagPopular;
      case 'NEW':
        return tagNew;
      case 'VALUE':
        return tagValue;
      case 'DEAL':
        return tagDeal;
      default:
        return saffron;
    }
  }
}
