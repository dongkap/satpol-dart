import 'package:do_core/models/locale_dto.dart';
import 'package:flutter/material.dart';

class LocaleStatic {
  final Locale localeDefault =
      const Locale.fromSubtags(languageCode: 'en', countryCode: 'US');

  final List<Locale> supportedLocales = <Locale>[
    const Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
    const Locale.fromSubtags(languageCode: 'id', countryCode: 'ID'),
  ];

  final List<LocaleDto> languages = <LocaleDto>[
    LocaleDto.fromJson({
      'localeCode': 'en-US',
      'identifier': 'English',
      'subIdentifier': 'United States',
      'icon': 'flag-icon flag-icon-us',
      'localeUsed': false,
      'localeDefault': true,
      'localeEnabled': true,
    }),
    LocaleDto.fromJson({
      'localeCode': 'id-ID',
      'identifier': 'Indonesian',
      'subIdentifier': 'Indonesia',
      'icon': 'flag-icon flag-icon-id',
      'localeUsed': false,
      'localeDefault': false,
      'localeEnabled': true,
    }),
  ];
}
