import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // Light Theme
  static const Color primary = Color(0xFF0083CD); // green
  static const Color secondary = Color(0xFF96D9FF);

  static const Color backgroundLightGrey = Color(0xFFE5E5E5);
  static const Color backgroundNearlyWhite = Color(0xFFFEFEFE);

  // Dark Theme
  static const Color darkPrimary = Color(0xFF004F79);
  static const Color darkSecondary = Color(0xFF587F91);

  static const Color backgroundDarkGrey = Color(0xFF383838);


  static const Color errorRed = Color(0xFFFF0000);

  static const Color dividerGrey = Color(0xFFD3D3D3);
  static const Color dividerDarkGrey = Color(0xFF656565);


  static const Color nearlyWhite = Color(0xFFFEFEFE);

  static const Color lightGrey = Color(0xFFBFBFBF);
  
  static const Color chipBackground = Color(0xFFEEF1F3);

  static const TextStyle headline = TextStyle( // h5 -> headline
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static const TextStyle subHeadline = TextStyle( // h6 -> headline
    fontFamily: fontName,
    fontWeight: FontWeight.bold,

    fontSize: 18,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static const BoxShadow boxShadow = BoxShadow(
    color: lightGrey,
    offset: Offset(
      0.0,
      1.0,
    ),
    blurRadius: 10.0,
    spreadRadius: 0.5,
  );

  // reference

  static const Color white = Color(0xFFFFFFFF);

  static const Color darkGrey = Color(0xFF7C7C7C);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);

  static const String fontName = 'Poppins';

  static const double APPBAR_ELEVATION = 10;

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: Colors.blue,
    fontFamily: 'Schyler',
    accentColor: primary,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: primary,
      onPrimary: Colors.black,
      primaryContainer: backgroundLightGrey,
      onPrimaryContainer: Colors.black,
      secondaryContainer: Color(0xFFE5E5E5),
      // onSecondaryContainer: ,
      tertiaryContainer: Color(0xFFFEFEFE),
      // onTertiaryContainer: ,
      errorContainer: darkGrey,
      onErrorContainer: Colors.white,
      shadow: lightGrey,
      secondary: secondary,
      onSecondary: Colors.white,
      error: Colors.black,
      onError: Colors.white,
      background: Colors.white,
      onBackground: Colors.red,
      surface: Colors.pink,
      onSurface: Colors.black12,
    ),
    scaffoldBackgroundColor: backgroundLightGrey,
    dividerTheme: DividerThemeData(
      color: AppTheme.dividerDarkGrey,
    ),
    appBarTheme: const AppBarTheme(
      brightness: Brightness.dark,
      elevation: APPBAR_ELEVATION,
      textTheme: TextTheme(
        headline6: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      color: primary,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: Colors.blue,
    accentColor: primary,
    fontFamily: 'Schyler',
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: primary,
      onPrimary: Colors.white,
      primaryContainer: backgroundDarkGrey,
      onPrimaryContainer: Colors.black,
      secondaryContainer: Color(0xFF2F2F2F),
      // onSecondaryContainer: ,
      tertiaryContainer: Color(0xFF383838),
      // onTertiaryContainer: ,
      errorContainer: Colors.black,
      onErrorContainer: lightGrey,
      shadow: Color(0xFF232323),
      secondary: Color(0xFF464646),
      onSecondary: Colors.white,
      error: Colors.black,
      onError: Colors.white,
      background: Color(0xFF3D3D3D),
      onBackground: Colors.white,
      surface: Colors.pink,
      onSurface: Colors.black12,
    ),
    scaffoldBackgroundColor: backgroundDarkGrey,
    dividerTheme: DividerThemeData(
      color: AppTheme.dividerGrey,
    ),
    appBarTheme: const AppBarTheme(
      elevation: APPBAR_ELEVATION,
      textTheme: TextTheme(
        subtitle1: TextStyle(
          color: primary,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );

}
