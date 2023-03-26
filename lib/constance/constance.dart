import 'package:flutter/material.dart';

var darkTheme = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(
  background: Color(0xff19202E),
  primary: Color(0xff1E2738),
  onPrimary: Color(0xffA5B3CE),
));
var dayTheme = ThemeData.light().copyWith(
  colorScheme: const ColorScheme.light(
      background: Color(0xffF4F7FA),
      primary: Colors.white,
      onPrimary: Colors.black),
);
