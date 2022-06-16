part of 'theme_mode_bloc.dart';

class ThemeModeState extends Equatable {
  const ThemeModeState({required this.themeMode, required this.darkMode});

  final ThemeMode themeMode;
  final bool darkMode;

  @override
  List<ThemeMode> get props => [themeMode];
}
