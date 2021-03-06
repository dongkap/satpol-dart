import 'package:json_annotation/json_annotation.dart';

part 'settings_dto.g.dart';

@JsonSerializable()
class SettingsDto {
  SettingsDto(
    this.localeCode,
    this.localeIdentifier,
    this.localeIcon,
    this.theme,
  );

  factory SettingsDto.fromJson(Map<String, dynamic> json) =>
      _$SettingsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsDtoToJson(this);

  String localeCode;
  String localeIdentifier;
  String localeIcon;
  String theme;
}
