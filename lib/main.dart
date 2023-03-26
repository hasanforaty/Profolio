import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profolio/blocs/theme_blocs.dart';
import 'package:profolio/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CurrentThemeBloc(),
      child: BlocBuilder<CurrentThemeBloc, ThemeData>(
        builder: (_, currentTheme) {
          return MaterialApp(
            title: "'hasan's Profolio",
            debugShowCheckedModeBanner: false,
            theme: currentTheme,
            onGenerateRoute: (settings) =>
                RouteGenerator.onGenerateRoute(settings),
            initialRoute: RouteGenerator.home,
          );
        },
      ),
    );
  }
}
