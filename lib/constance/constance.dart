import 'dart:html';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:profolio/constance/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:profolio/constance/custom_icon_icons.dart';
import '../module/project_model.dart';

TextTheme _textTheme(String familyFont) => TextTheme(
      displayLarge:
          const TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(
          fontSize: 36.0, fontStyle: FontStyle.italic, fontFamily: familyFont),
      titleMedium: TextStyle(
          fontSize: 18.0, fontStyle: FontStyle.italic, fontFamily: familyFont),
      bodyMedium: TextStyle(fontSize: 16.0, fontFamily: familyFont),
      bodySmall: TextStyle(fontSize: 8.0, fontFamily: familyFont),
    );

ThemeData getDayTheme() {
  print(Intl.getCurrentLocale());
  var familyFont = Intl.getCurrentLocale().contains("fa") ? 'iranS' : "Didot";
  return ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light(
      primary: primaryDay,
      secondary: secondaryDay,
      onPrimary: Colors.black,
      background: primaryDay,
    ),
    textTheme: _textTheme(familyFont),
  );
}

ThemeData getDarkTheme() {
  var familyFont = Intl.getCurrentLocale().contains("fa") ? 'iranS' : "Didot";
  return ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(
      background: Color(0xff19202E),
      primary: primaryDark,
      onPrimary: Color(0xffA5B3CE),
    ),
    textTheme: _textTheme(familyFont),
  );
}

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

void checkWindow() {
  kIsWindow = _isWeb();
  kIsMobile = _isMobile();
}

String getOSInsideWeb() {
  final userAgent = window.navigator.userAgent.toString().toLowerCase();
  if (userAgent.contains("iphone")) return "ios";
  if (userAgent.contains("ipad")) return "ios";
  if (userAgent.contains("android")) return "Android";
  return "Web";
}

bool _isWeb() => getOSInsideWeb() == "Web";
bool _isMobile() => getOSInsideWeb() == "Android" || getOSInsideWeb() == "ios";

BoxDecoration getBoxDecoration(BuildContext context) => BoxDecoration(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
    );

List<ProjectModel> getMyProjects(BuildContext context) {
  var localization = AppLocalizations.of(context);
  return [
    ProjectModel(
        title: localization?.presenceProjectTitle ?? "",
        explanation: localization?.presenceProjectBody ?? "",
        imageUrl: "images/attendance.gif",
        techStack: [CustomIcon.flutter, CustomIcon.dart],
        restricted: true),
    ProjectModel(
        title: localization?.portfolioSiteTitle ?? "",
        explanation: localization?.portfolioSiteBody ?? "",
        imageUrl: "",
        techStack: [CustomIcon.flutter, CustomIcon.dart],
        restricted: false,
        gitHubUrl: "https://github.com/hasanforaty/Profolio"),
    ProjectModel(
        title: localization?.momayeziTitle ?? "",
        explanation: localization?.momayeziBody ?? "",
        imageUrl: "images/momayezi_3.gif",
        techStack: [CustomIcon.android, CustomIcon.kotlin],
        restricted: true),
    ProjectModel(
        title: localization?.massSmsTitle ?? "",
        explanation: localization?.massSmsBody ?? "",
        imageUrl: "",
        techStack: [CustomIcon.android, CustomIcon.kotlin],
        restricted: true),
  ];
}
