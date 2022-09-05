import 'package:flutter/material.dart';
import 'package:prosms/constants.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
      primaryColor: psPrimaryColor,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: appBarTheme,
      iconTheme: const IconThemeData(color: psContentColorLightTheme),
      textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
          .apply(bodyColor: psContentColorLightTheme),
      colorScheme: const ColorScheme.light(
        primary: psPrimaryColor,
        secondary: psSecondaryColor,
        error: psErrorColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: psContentColorLightTheme.withOpacity(0.7),
        unselectedItemColor: psContentColorLightTheme.withOpacity(0.32),
        selectedIconTheme: const IconThemeData(color: psPrimaryColor),
        showUnselectedLabels: true,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: psPrimaryColor, foregroundColor: Colors.white));
}

ThemeData darkThemeData(BuildContext context) {
  // Bydefault flutter provie us light and dark theme
  // we just modify it as our need
  return ThemeData.dark().copyWith(
    primaryColor: psPrimaryColor,
    scaffoldBackgroundColor: psContentColorLightTheme,
    appBarTheme: appBarTheme,
    iconTheme: const IconThemeData(color: psContentColorDarkTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: psContentColorDarkTheme),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: psPrimaryColor,
      secondary: psSecondaryColor,
      error: psErrorColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: psContentColorLightTheme,
      selectedItemColor: Colors.white70,
      unselectedItemColor: psContentColorDarkTheme.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: psPrimaryColor),
      showUnselectedLabels: true,
    ),
  );
}

const appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);
