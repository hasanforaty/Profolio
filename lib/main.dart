import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:profolio/blocs/local_bloc.dart';
import 'package:profolio/blocs/theme_blocs.dart';
import 'package:profolio/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CurrentThemeBloc()),
        BlocProvider(create: (_) => CurrentLocalBloc())
      ],
      child: BlocBuilder<CurrentLocalBloc, SupportedLocal>(
        builder: (_, supportedLocal) {
          return BlocBuilder<CurrentThemeBloc, ThemeData>(
            builder: (_, currentTheme) {
              Locale currentLocal;
              switch (supportedLocal) {
                case SupportedLocal.en:
                  currentLocal = const Locale("en");
                  break;
                case SupportedLocal.fa:
                  currentLocal = const Locale("fa");
                  break;
              }
              return MaterialApp(
                title: "hasan's Portfolio",
                debugShowCheckedModeBanner: false,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                supportedLocales: const [
                  Locale('en'),
                  Locale("fa"),
                ],
                locale: currentLocal,
                theme: currentTheme,
                onGenerateRoute: (settings) =>
                    RouteGenerator.onGenerateRoute(settings),
                initialRoute: RouteGenerator.home,
              );
            },
          );
        },
      ),
    );
  }
}
