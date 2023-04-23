import 'package:flutter/material.dart';
import 'package:profolio/constance/colors.dart';

var darkTheme = ThemeData.dark().copyWith(
  colorScheme: const ColorScheme.dark(
    background: Color(0xff19202E),
    primary: primaryDark,
    onPrimary: Color(0xffA5B3CE),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(
        fontSize: 36.0, fontStyle: FontStyle.italic, fontFamily: "Didot"),
    bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Didot'),
  ),
);
var dayTheme = ThemeData.light().copyWith(
  colorScheme: const ColorScheme.light(
    primary: primaryDay,
    secondary: secondaryDay,
    onPrimary: Colors.black,
    background: primaryDay,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(
        fontSize: 36.0, fontStyle: FontStyle.italic, fontFamily: "Didot"),
    bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Didot'),
  ),
);

bool kIsMobile = false;
bool kIsWindow = true;

void checkWindow(BuildContext context) {
  var currentWidth = MediaQuery.of(context).size.width;
  if (currentWidth > 900) {
    kIsMobile = false;
    kIsWindow = true;
  } else {
    kIsMobile = true;
    kIsWindow = false;
  }
}
