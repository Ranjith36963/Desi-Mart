import 'package:flutter/material.dart';

abstract final class AppColours {
  // Brand colours
  static const Color saffron = Color(0xFFE8722A);
  static const Color green = Color(0xFF2D7A3A);
  static const Color cream = Color(0xFFFFFDF7);
  static const Color darkText = Color(0xFF1A1A1A);

  // Saffron shades
  static const Color saffronLight = Color(0xFFFFF3EB);
  static const Color saffronDark = Color(0xFFC45D1E);

  // Green shades
  static const Color greenLight = Color(0xFFE8F5EA);
  static const Color greenDark = Color(0xFF1B5E25);

  // Gold (loyalty/rewards)
  static const Color gold = Color(0xFFD4A017);
  static const Color goldLight = Color(0xFFFFF8E1);

  // Neutral — match prototype exactly
  static const Color grey100 = Color(0xFFF3F4F6);
  static const Color grey200 = Color(0xFFE5E7EB);
  static const Color grey400 = Color(0xFF9CA3AF);
  static const Color grey600 = Color(0xFF6B7280);
  static const Color grey800 = Color(0xFF374151);
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
      case 'SALE':
        return tagHot;
      default:
        return saffron;
    }
  }

  // Status indicator
  static const Color openGreen = Color(0xFF4ADE80);
}
