// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsDto _$SettingsDtoFromJson(Map<String, dynamic> json) => SettingsDto(
      json['localeCode'] as String,
      json['localeIdentifier'] as String,
      json['localeIcon'] as String,
      json['theme'] as String,
    );

Map<String, dynamic> _$SettingsDtoToJson(SettingsDto instance) =>
    <String, dynamic>{
      'localeCode': instance.localeCode,
      'localeIdentifier': instance.localeIdentifier,
      'localeIcon': instance.localeIcon,
      'theme': instance.theme,
    };
