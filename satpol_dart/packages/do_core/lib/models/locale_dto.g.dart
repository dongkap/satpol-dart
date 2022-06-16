// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locale_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocaleDto _$LocaleDtoFromJson(Map<String, dynamic> json) => LocaleDto(
      json['localeCode'] as String,
      json['identifier'] as String,
      json['subIdentifier'] as String,
      json['icon'] as String,
      json['localeUsed'] as bool,
      json['localeDefault'] as bool,
      json['localeEnabled'] as bool,
    );

Map<String, dynamic> _$LocaleDtoToJson(LocaleDto instance) => <String, dynamic>{
      'localeCode': instance.localeCode,
      'identifier': instance.identifier,
      'subIdentifier': instance.subIdentifier,
      'icon': instance.icon,
      'localeUsed': instance.localeUsed,
      'localeDefault': instance.localeDefault,
      'localeEnabled': instance.localeEnabled,
    };
