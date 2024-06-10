import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Colors.white,
    primary: Colors.black,
    onPrimary: Colors.white,
  ),
  canvasColor: Colors.grey.shade100,
  cardColor: Colors.white,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    surface: Colors.grey,
    primary: Colors.white,
    onPrimary: Colors.black,
  ),
  canvasColor: Colors.grey.shade900,
  cardColor: Colors.black,
);

ThemeData blueTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Colors.white,
    primary: Colors.blue,
    onPrimary: Colors.white, 
  ),
  canvasColor: Colors.white,
  cardColor: Colors.blue.shade50,
);

ThemeData pinkTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Colors.white,
    primary: Colors.pink,
    onPrimary: Colors.white,
  ),
  canvasColor: Colors.white,
  cardColor: Colors.pink.shade50,
);

ThemeData amberTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Colors.white,
    primary: Colors.amber,
    onPrimary: Colors.white,
  ),
  canvasColor: Colors.white,
  cardColor: Colors.amber.shade50,
);

