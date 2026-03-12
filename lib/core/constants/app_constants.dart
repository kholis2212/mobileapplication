import 'package:flutter/material.dart';

// Berisi konstanta-konstanta yang digunakan di aplikasi
class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'Dashboard Mahasiswa D4TI';
  static const String appVersion = '1.0.0';

  // Keys
  static const String userPrefsKey = 'user_prefs';

  // Spacing
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;

  // Border Radius
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 12.0;
  static const double radiusLarge = 16.0;

  // Dashboard Gradient Colors
  static const List<List<Color>> dashboardGradients = [
    [const Color(0xFF667eea), const Color(0xFF764ba2)], // Purple
    [const Color(0xFFf093fb), const Color(0xFFf5576c)], // Pink
    [const Color(0xFF4facfe), const Color(0xFF00f2fe)], // Blue
    [const Color(0xFF43e97b), const Color(0xFF38f9d7)], // Green
  ];

  // Individual Gradient Colors (optional - for direct access)
  static const List<Color> gradientPurple = [
    const Color(0xFF667eea),
    const Color(0xFF764ba2),
  ];

  static const List<Color> gradientPink = [
    const Color(0xFFf093fb),
    const Color(0xFFf5576c),
  ];

  static const List<Color> gradientBlue = [
    const Color(0xFF4facfe),
    const Color(0xFF00f2fe),
  ];

  static const List<Color> gradientGreen = [
    const Color(0xFF43e97b),
    const Color(0xFF38f9d7),
  ];
}