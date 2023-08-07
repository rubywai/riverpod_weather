import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

sealed class WeatherTheme {
  ThemeData getTheme();
}

class LightTheme extends WeatherTheme {
  @override
  ThemeData getTheme() {
    return ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.indigo));
  }
}

class DarkTheme extends WeatherTheme {
  @override
  ThemeData getTheme() {
    return ThemeData.dark().copyWith(
        switchTheme: SwitchThemeData(
            thumbColor: MaterialStateProperty.resolveWith((value) {
      return Colors.white;
    }), trackColor: MaterialStateProperty.resolveWith((value) {
      return Colors.grey;
    })));
  }
}
