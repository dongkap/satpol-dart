import 'package:do_core/models/locale_dto.dart';
import 'package:do_core/models/locale_static.dart';
import 'package:do_core/services/core_locator.dart';
import 'package:do_core/services/shared_preferences_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

class LanguageRepository {
  final logger = Logger();
  final SharedPreferencesService _sharedPreferences =
      coreLocator<SharedPreferencesService>();
  final List<LocaleDto> locales = LocaleStatic().languages;
  String localeDefault = dotenv.env['LOCALE'] ?? 'en-US';

  LocaleDto getCurrentLocale() {
    final String localeCode = _sharedPreferences.getString('locale').isEmpty
        ? localeDefault
        : _sharedPreferences.getString('locale');
    return locales.singleWhere((element) => element.localeCode == localeCode);
  }

  List<LocaleDto> getData() {
    final String localeCode = _sharedPreferences.getString('locale');
    LocaleDto locale =
        locales.singleWhere((element) => element.localeCode == localeCode);
    final int index =
        locales.indexWhere((element) => element.localeCode == localeCode);
    locale.localeUsed = true;
    locales.replaceRange(index, index + 1, [locale]);
    return locales;
  }
}
