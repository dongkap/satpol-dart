import 'package:do_core/services/core_locator.dart';
import 'package:do_core/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

class ThemeRepository {
  final logger = Logger();
  final SharedPreferencesService _sharedPreferences =
      coreLocator<SharedPreferencesService>();
  String themeDefault = dotenv.env['LOCALE'] ?? 'en-US';

  bool getTheme() {
    if (_sharedPreferences.getString('theme') == ThemeMode.dark.name) {
      return true;
    } else {
      return false;
    }
  }
}
