import 'package:do_core/core.dart';
import 'package:do_core/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_mode_event.dart';
part 'theme_mode_state.dart';

class ThemeModeBloc extends Bloc<ThemeModeEvent, ThemeModeState> {
  ThemeModeBloc()
      : super(ThemeModeState(
            themeMode: ThemeStatic().themeMode,
            darkMode: ThemeStatic().darkMode)) {
    on<ThemeModeChanged>(_onThemeMode);
  }
  final ThemeRepository _themeRepo = coreLocator<ThemeRepository>();

  void _onThemeMode(ThemeModeEvent event, Emitter<ThemeModeState> emit) {
    if (_themeRepo.getTheme()) {
      emit(const ThemeModeState(themeMode: ThemeMode.dark, darkMode: true));
    } else {
      emit(const ThemeModeState(themeMode: ThemeMode.light, darkMode: false));
    }
  }
}
