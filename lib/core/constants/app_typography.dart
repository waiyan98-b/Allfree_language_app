import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTypography {
  AppTypography._();

  // Headings
  static const TextStyle h1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
    height: 1.3,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.3,
    height: 1.3,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.2,
    height: 1.3,
  );

  // Body Text
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.4,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    height: 1.4,
  );

  // Thai Script
  static const TextStyle thaiDisplay = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w600,
    height: 1.5,
  );

  static const TextStyle thaiLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  static const TextStyle thaiMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );

  // Myanmar Script
  static const TextStyle myanmarText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.6,
  );

  // Romanization
  static const TextStyle romanization = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    color: AppColors.primary,
    height: 1.3,
  );

  // Thai Tone Label
  static const TextStyle toneLabel = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
  );
}
