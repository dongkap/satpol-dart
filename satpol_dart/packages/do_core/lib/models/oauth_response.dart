import 'package:json_annotation/json_annotation.dart';

part 'oauth_response.g.dart';

@JsonSerializable()
class OAuthResponse {
  const OAuthResponse(
      this.accessToken,
      this.refreshToken,
      this.tokenType,
      this.publicKey,
      this.expiresIn,
      this.authority,
      this.provider,
      this.image,
      this.email,
      this.serverDate,
      this.locale,
      this.theme,
      this.name,
      this.username,
      this.appCode,
      this.corporateCode,
      this.corporateName,
      this.corporateUuid);

  factory OAuthResponse.fromJson(Map<String, dynamic> json) =>
      _$OAuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OAuthResponseToJson(this);

  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @JsonKey(name: 'token_type')
  final String tokenType;
  @JsonKey(name: 'xrkey')
  final String publicKey;
  @JsonKey(name: 'expires_in')
  final int expiresIn;
  final String authority;
  final String provider;
  @JsonKey(name: 'image')
  final dynamic image;
  final String email;
  @JsonKey(name: 'server_date')
  final String serverDate;
  @JsonKey(name: 'locale', defaultValue: 'en-US')
  final String locale;
  @JsonKey(name: 'theme', defaultValue: 'default')
  final String theme;
  final String name;
  final String username;
  @JsonKey(name: 'app_code', defaultValue: 'dongkap')
  final String appCode;
  @JsonKey(name: 'corporate_code')
  final dynamic corporateCode;
  @JsonKey(name: 'corporate_name')
  final dynamic corporateName;
  @JsonKey(name: 'corporate_uuid')
  final dynamic corporateUuid;

  static const empty = OAuthResponse(
      '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '');

  @override
  String toString() {
    return '''
OAuthResponse : {${'tokenType: $tokenType, '}${'publicKey: $publicKey, '}${'expiresIn: $expiresIn, '}${'authority: $authority, '}${'provider: $provider, '}${'image: $image, '}${'email: $email, '}${'serverDate: $serverDate, '}${'locale: $locale, '}${'theme: $theme, '}${'name: $name, '}${'username: $username, '}${'appCode: $appCode, '}${'corporateCode: $corporateCode, '}${'corporateCode: $corporateName, '}${'corporateUuid: $corporateUuid}'}''';
  }
}
