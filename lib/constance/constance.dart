import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:profolio/blocs/local_bloc.dart';
import 'package:profolio/constance/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:profolio/constance/custom_icon_icons.dart';
import 'package:profolio/module/experience_model.dart';
import '../module/project_model.dart';
import 'dart:ui' as ui;

TextTheme _textTheme(String familyFont, bool day) => TextTheme(
      displayLarge: TextStyle(
        fontSize: 72.0,
        fontWeight: FontWeight.bold,
        color: day ? Colors.black : const Color(0xffA5B3CE),
      ),
      titleLarge: TextStyle(
          fontSize: 36.0,
          fontStyle: FontStyle.italic,
          fontFamily: familyFont,
          color: day ? Colors.black : const Color(0xffA5B3CE)),
      titleMedium: TextStyle(
          fontSize: 18.0,
          fontStyle: FontStyle.italic,
          fontFamily: familyFont,
          color: day ? Colors.black : const Color(0xffA5B3CE)),
      bodyMedium: TextStyle(
          fontSize: 16.0,
          fontFamily: familyFont,
          color: day ? Colors.black : const Color(0xffA5B3CE)),
      bodySmall: TextStyle(
          fontSize: 8.0,
          fontFamily: familyFont,
          color: day ? Colors.black : const Color(0xffA5B3CE)),
    );

ThemeData getDayTheme() {
  print(Intl.getCurrentLocale());
  var familyFont = Intl.getCurrentLocale().contains("fa") ? 'iranS' : "Didot";
  return ThemeData.light().copyWith(
    primaryColor: primaryDay,
    colorScheme: const ColorScheme.light(
      primary: primaryDay,
      secondary: secondaryDay,
      onPrimary: Colors.black,
      background: primaryDay,
    ),
    textTheme: _textTheme(familyFont, true),
  );
}

ui.TextDirection getTextDirection(BuildContext context) {
  var currentLocal = context.read<CurrentLocalBloc>().state;
  return currentLocal == SupportedLocal.fa
      ? ui.TextDirection.rtl
      : ui.TextDirection.ltr;
}

ThemeData getDarkTheme() {
  var familyFont = Intl.getCurrentLocale().contains("fa") ? 'iranS' : "Didot";
  return ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(
      background: Color(0xff19202E),
      primary: primaryDark,
      onPrimary: Color(0xffA5B3CE),
      secondary: primaryDark,
    ),
    textTheme: _textTheme(familyFont, false),
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

List<ProjectModel> getMyMainProjects(BuildContext context) {
  var localization = AppLocalizations.of(context);
  return [
    ProjectModel(
        title: localization?.presenceProjectTitle ?? "",
        explanation: localization?.presenceProjectBody ?? "",
        imageUrl: "https://shahrejahan.com/images/attendance.gif",
        techStack: [CustomIcon.flutter, CustomIcon.dart],
        restricted: true),
    ProjectModel(
        title: localization?.portfolioSiteTitle ?? "",
        explanation: localization?.portfolioSiteBody ?? "",
        imageUrl: "https://shahrejahan.com/images/portfolio.png",
        techStack: [CustomIcon.flutter, CustomIcon.dart],
        restricted: false,
        gitHubUrl: "https://github.com/hasanforaty/Profolio",
        applicationUrl: "https://hasanforaty.github.io/"),
    ProjectModel(
        title: localization?.shahreJahanProjectTitle ?? "",
        explanation: localization?.shahreJahanProjectBody ?? "",
        imageUrl: "https://shahrejahan.com/images/shahrejahan.png",
        techStack: [CustomIcon.flutter, CustomIcon.dart],
        restricted: true,
        applicationUrl: "https://shahrejahan.com/"),
    ProjectModel(
        title: localization?.momayeziTitle ?? "",
        explanation: localization?.momayeziBody ?? "",
        imageUrl: "https://shahrejahan.com/images/momayezi_3.gif",
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

List<ProjectModel> getMyAllProjects(BuildContext context) {
  var localization = AppLocalizations.of(context);
  return [
    ProjectModel(
        title: localization?.presenceProjectTitle ?? "",
        explanation: localization?.presenceProjectBody ?? "",
        imageUrl: "https://shahrejahan.com/images/attendance.gif",
        techStack: [CustomIcon.flutter, CustomIcon.dart],
        restricted: true),
    ProjectModel(
        title: localization?.portfolioSiteTitle ?? "",
        explanation: localization?.portfolioSiteBody ?? "",
        imageUrl: "https://shahrejahan.com/images/portfolio.png",
        techStack: [CustomIcon.flutter, CustomIcon.dart],
        restricted: false,
        gitHubUrl: "https://github.com/hasanforaty/Profolio",
        applicationUrl: "https://hasanforaty.github.io/"),
    ProjectModel(
        title: localization?.shahreJahanProjectTitle ?? "",
        explanation: localization?.shahreJahanProjectBody ?? "",
        imageUrl: "https://shahrejahan.com/images/shahrejahan.png",
        techStack: [CustomIcon.flutter, CustomIcon.dart],
        restricted: true,
        applicationUrl: "https://shahrejahan.com/"),
    ProjectModel(
        title: localization?.momayeziTitle ?? "",
        explanation: localization?.momayeziBody ?? "",
        imageUrl: "https://shahrejahan.com/images/momayezi_3.gif",
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

List<ExperienceModel> getExperienceItems(BuildContext context) {
  var localization = AppLocalizations.of(context);
  return [
    ExperienceModel(
        title: localization?.androidExTitle ?? "",
        logoUrl: "logos/android_1.svg",
        description: localization?.androidExBody ?? ""),
    ExperienceModel(
        title: localization?.flutterExTitle ?? "",
        logoUrl: "logos/flutter_1.svg",
        description: localization?.flutterExBody ?? ""),
  ];
}
