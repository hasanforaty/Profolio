import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profolio/screen/home_screen.dart';
import 'package:profolio/screen/projects_screen.dart';

class RouteGenerator {
  static const String home = "/";
  static const String projects = "/projects";
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        {
          return MaterialPageRoute(
              builder: (_) => const HomeScreen(), settings: settings);
        }
      case projects:
        {
          return MaterialPageRoute(
              builder: (_) => const ProjectsScreen(), settings: settings);
        }
      default:
        {
          return MaterialPageRoute(
            builder: (_) => const HomeScreen(),
          );
        }
    }
  }

  static void goTo(
      {required Routes routes,
      required BuildContext context,
      bool removeStack = false}) {
    String name;
    switch (routes) {
      case Routes.home:
        name = home;
        break;
      case Routes.projects:
        name = projects;
        break;
    }
    if (removeStack) {
      Navigator.pushReplacementNamed(context, name);
    } else {
      Navigator.pushNamed(context, name);
    }
  }
}

enum Routes {
  home,
  projects;
}
