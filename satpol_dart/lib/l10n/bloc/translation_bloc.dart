import 'dart:ui';

import 'package:do_core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:do_core/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'translation_event.dart';
part 'translation_state.dart';

class TranslationBloc extends Bloc<TranslationEvent, TranslationState> {
  TranslationBloc()
      : super(TranslationState(locale: LocaleStatic().localeDefault)) {
    on<TranslationChanged>(_onTranslation);
  }
  final LanguageRepository _languageRepo = coreLocator<LanguageRepository>();

  void _onTranslation(TranslationEvent event, Emitter<TranslationState> emit) {
    final LocaleDto locale = _languageRepo.getCurrentLocale();
    emit(TranslationState(locale: getLanguageCode(locale)));
  }

  Locale getLanguageCode(LocaleDto locale) {
    return Locale.fromSubtags(
        languageCode: locale.localeCode.split('-')[0],
        countryCode: locale.localeCode.split('-')[1]);
  }
}
