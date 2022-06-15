// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OAuthResponse _$OAuthResponseFromJson(Map<String, dynamic> json) =>
    OAuthResponse(
      json['access_token'] as String,
      json['refresh_token'] as String,
      json['token_type'] as String,
      json['xrkey'] as String,
      json['expires_in'] as int,
      json['authority'] as String,
      json['provider'] as String,
      json['image'],
      json['email'] as String,
      json['server_date'] as String,
      json['locale'] as String? ?? 'en-US',
      json['theme'] as String? ?? 'default',
      json['name'] as String,
      json['username'] as String,
      json['app_code'] as String? ?? 'dongkap',
      json['corporate_code'],
      json['corporate_name'],
      json['corporate_uuid'],
    );

Map<String, dynamic> _$OAuthResponseToJson(OAuthResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'token_type': instance.tokenType,
      'xrkey': instance.publicKey,
      'expires_in': instance.expiresIn,
      'authority': instance.authority,
      'provider': instance.provider,
      'image': instance.image,
      'email': instance.email,
      'server_date': instance.serverDate,
      'locale': instance.locale,
      'theme': instance.theme,
      'name': instance.name,
      'username': instance.username,
      'app_code': instance.appCode,
      'corporate_code': instance.corporateCode,
      'corporate_name': instance.corporateName,
      'corporate_uuid': instance.corporateUuid,
    };
