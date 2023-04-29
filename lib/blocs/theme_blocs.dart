import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profolio/constance/constance.dart';

class CurrentThemeBloc extends Cubit<ThemeData> {
  CurrentThemeBloc() : super(getDayTheme());

  void changeTheme() {
    emit(state == getDayTheme() ? getDarkTheme() : getDayTheme());
  }
}
