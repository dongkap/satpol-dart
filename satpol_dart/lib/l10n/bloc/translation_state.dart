part of 'translation_bloc.dart';

class TranslationState extends Equatable {
  const TranslationState({required this.locale});

  final Locale locale;

  @override
  List<Locale> get props => [locale];
}
