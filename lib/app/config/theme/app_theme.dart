import 'package:flutter/material.dart';
import 'package:pelato_markazi/app/config/theme/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: const Color(0xFF006A66),
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF006A66),
        onPrimary: Color(0xFFFFFFFF),
        primaryContainer: Color(0xFF70F7F0),
        onPrimaryContainer: Color(0xFF00201F),
        secondary: Color(0xFF006B58),
        onSecondary: Color(0xFFFFFFFF),
        secondaryContainer: Color(0xFF7CF8D8),
        onSecondaryContainer: Color(0xFF002019),
        tertiary: Color(0xFF626200),
        onTertiary: Color(0xFFFFFFFF),
        tertiaryContainer: Color(0xFFE9E963),
        onTertiaryContainer: Color(0xFF1D1D00),
        error: Color(0xFFBA1A1A),
        errorContainer: Color(0xFFFFDAD6),
        onError: Color(0xFFFFFFFF),
        onErrorContainer: Color(0xFF410002),
        background: Color(0xFFFFFFFF),
        onBackground: Color(0xFF002022),
        surface: Color(0xFFF3FEFF),
        onSurface: Color(0xFF002022),
        surfaceVariant: Color(0xFFDAE5E3),
        onSurfaceVariant: Color(0xFF3F4948),
        outline: Color(0xFF6F7978),
        onInverseSurface: Color(0xFFC3FBFF),
        inverseSurface: Color(0xFF00373A),
        inversePrimary: Color(0xFF4EDAD4),
        shadow: Color(0xFF000000),
        surfaceTint: Color(0xFF006A66),
        outlineVariant: Color(0xFFBEC9C7),
        scrim: Color(0xFF000000),
      ),
      fontFamily: 'Sans',
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff004847),
        elevation: 3,
      ),
      cardColor: AppColors.blueColor,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF002022),
      primaryColor: const Color(0xFF4EDAD4),
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFF4EDAD4),
        onPrimary: Color(0xFF003735),
        primaryContainer: Color(0xFF00504D),
        onPrimaryContainer: Color(0xFF70F7F0),
        secondary: Color(0xFF5DDBBC),
        onSecondary: Color(0xFF00382D),
        secondaryContainer: Color(0xFF005142),
        onSecondaryContainer: Color(0xFF7CF8D8),
        tertiary: Color(0xFFCDCC4A),
        onTertiary: Color(0xFF323200),
        tertiaryContainer: Color(0xFF4A4900),
        onTertiaryContainer: Color(0xFFE9E963),
        error: Color(0xFFFFB4AB),
        errorContainer: Color(0xFF93000A),
        onError: Color(0xFF690005),
        onErrorContainer: Color(0xFFFFDAD6),
        background: Color(0xFF002022),
        onBackground: Color(0xFF70F5FF),
        surface: Color(0xFF002022),
        onSurface: Colors.white,
        surfaceVariant: Color(0xFF3F4948),
        onSurfaceVariant: Color(0xFFBEC9C7),
        outline: Color(0xFF889391),
        onInverseSurface: Color(0xFF002022),
        inverseSurface: Color(0xFF70F5FF),
        inversePrimary: Color(0xFF006A66),
        shadow: Color(0xFF000000),
        surfaceTint: Color(0xFF4EDAD4),
        outlineVariant: Color(0xFF3F4948),
        scrim: Color(0xFF000000),
      ),
      fontFamily: 'Sans',
      appBarTheme: const AppBarTheme(
        // backgroundColor: AppColors.darkGreenAccentColor,
        elevation: 3,
      ),
      cardColor: const Color(0xFF04292b),
    );
  }
}
