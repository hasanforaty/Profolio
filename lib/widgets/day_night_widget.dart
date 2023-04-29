import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profolio/blocs/theme_blocs.dart';
import 'package:rive/rive.dart';

import '../constance/constance.dart';

class DayAndNightWidget extends StatefulWidget {
  const DayAndNightWidget({Key? key}) : super(key: key);

  @override
  State<DayAndNightWidget> createState() => _DayAndNightWidgetState();
}

class _DayAndNightWidgetState extends State<DayAndNightWidget> {
  late SMIBool day;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentThemeBloc, ThemeData>(builder: (context, theme) {
      var isDay = theme == getDayTheme();

      return GestureDetector(
        onTap: () {
          context.read<CurrentThemeBloc>().changeTheme();
          day.value = !isDay;
        },
        child: SizedBox(
          height: 32,
          width: 84,
          child: RiveAnimation.asset(
            "rive/day_night.riv",
            fit: BoxFit.fill,
            onInit: (artboard) {
              var controller = getStateMachineController(artboard);
              day = controller.findSMI("Boolean 1");
              day.value = true;
            },
          ),
        ),
      );
    });
  }

  StateMachineController getStateMachineController(Artboard artboard,
      {String machineName = "State Machine 1"}) {
    var controller =
        StateMachineController.fromArtboard(artboard, machineName)!;
    artboard.addController(controller);
    return controller;
  }
}
