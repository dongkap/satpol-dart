import 'dart:async';
import 'dart:convert';

import 'package:do_core/models.dart';
import 'package:do_core/services/core_locator.dart';
import 'package:do_core/services/shared_preferences_service.dart';
import 'package:logger/logger.dart';

class AuthenticationRepository {
  final logger = Logger();
  final SharedPreferencesService _sharedPreferences =
      coreLocator<SharedPreferencesService>();

  bool get status {
    if (_sharedPreferences.isKeyExists('access_token')) {
      return true;
    } else {
      return false;
    }
  }

  OAuthResponse getAuth() {
    return OAuthResponse.fromJson({
      'access_token': _sharedPreferences.getString('access_token'),
      'refresh_token': _sharedPreferences.getString('refresh_token'),
      'token_type': _sharedPreferences.getString('token_type'),
      'xrkey': _sharedPreferences.getString('xrkey'),
      'expires_in': _sharedPreferences.getInt('expires_in'),
      'authority': _sharedPreferences.getString('authority'),
      'provider': _sharedPreferences.getString('provider'),
      'image': _sharedPreferences.getString('image'),
      'email': _sharedPreferences.getString('email'),
      'server_date': _sharedPreferences.getString('server_date'),
      'locale': _sharedPreferences.getString('locale'),
      'theme': _sharedPreferences.getString('theme'),
      'name': _sharedPreferences.getString('name'),
      'username': _sharedPreferences.getString('username'),
      'app_code': _sharedPreferences.getString('app_code'),
      'corporate_code': _sharedPreferences.getString('corporate_code'),
      'corporate_name': _sharedPreferences.getString('corporate_name'),
      'corporate_uuid': _sharedPreferences.getString('corporate_uuid'),
    });
  }

  Future<void> putAuth(OAuthResponse value) async {
    await _sharedPreferences.putString('access_token', value.accessToken);
    await _sharedPreferences.putString('refresh_token', value.refreshToken);
    await _sharedPreferences.putString('token_type', value.tokenType);
    await _sharedPreferences.putString('xrkey', value.publicKey);
    await _sharedPreferences.putInt('expires_in', value.expiresIn);
    await _sharedPreferences.putString('authority', value.authority);
    await _sharedPreferences.putString('provider', value.provider);
    if (value.image != null) {
      await _sharedPreferences.putString('image', value.image);
    }
    await _sharedPreferences.putString('email', value.email);
    await _sharedPreferences.putString('server_date', value.serverDate);
    await _sharedPreferences.putString('locale', value.locale);
    await _sharedPreferences.putString('theme', value.theme);
    await _sharedPreferences.putString('name', value.name);
    await _sharedPreferences.putString('username', value.username);
    await _sharedPreferences.putString('app_code', value.appCode);
    if (value.corporateCode != null) {
      await _sharedPreferences.putString('corporate_code', value.corporateCode);
    }
    if (value.corporateName != null) {
      await _sharedPreferences.putString('corporate_name', value.corporateName);
    }
    if (value.corporateUuid != null) {
      await _sharedPreferences.putString('corporate_uuid', value.corporateUuid);
    }
  }

  Future<void> clearAuth() async {
    await _sharedPreferences.clearKey('username');
    await _sharedPreferences.clearKey('access_token');
    await _sharedPreferences.clearKey('refresh_token');
    await _sharedPreferences.clearKey('token_type');
    await _sharedPreferences.clearKey('expires_in');
    await _sharedPreferences.clearKey('authority');
    await _sharedPreferences.clearKey('provider');
    await _sharedPreferences.clearKey('server_date');
  }
}
