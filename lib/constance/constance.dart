import 'package:flutter/material.dart';
import 'package:profolio/constance/colors.dart';

var darkTheme = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(
  background: Color(0xff19202E),
  primary: primaryDark,
  onPrimary: Color(0xffA5B3CE),
));
var dayTheme = ThemeData.light().copyWith(
  colorScheme: const ColorScheme.light(
    primary: primaryDay,
    secondary: secondaryDay,
    onPrimary: Colors.black,
    background: primaryDay,
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
