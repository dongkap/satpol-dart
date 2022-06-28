import 'dart:convert';

import 'package:dio/dio.dart' hide Headers;
import 'package:do_core/api/auth/auth_api.dart';
import 'package:do_core/models/base_response.dart';
import 'package:do_core/repositories/authentication_repository.dart';
import 'package:do_core/services/core_locator.dart';
import 'package:do_core/services/shared_preferences_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

class HttpErrorInterceptors extends Interceptor {
  HttpErrorInterceptors(this._dio);
  final logger = Logger();
  final Dio _dio;
  final AuthAPI _authAPI = AuthAPI(Dio());
  final AuthenticationRepository _authenticationRepo =
      coreLocator<AuthenticationRepository>();
  final SharedPreferencesService _sharedPreferences =
      coreLocator<SharedPreferencesService>();
  int refreshCount = 0;

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    refreshCount = 0;
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    final int? statusCode = err.response?.statusCode;
    final BaseResponse response = BaseResponse.fromJson(
        (err.response?.data is List<int>)
            ? json.decode(utf8.decode(err.response?.data))
            : err.response?.data);
    switch (statusCode) {
      case 401:
        try {
          final String msg = response.respStatusMessage['invalid_token'];
          if (msg.isNotEmpty) {
            if (!hasRefreshToken(err.requestOptions.headers['authorization']) &&
                refreshCount <= 3) {
              await doRefreshToken().catchError((onError) {});
              return handler.resolve(await _retry(err.requestOptions));
            } else {
              await doLogOut();
            }
          }
        } catch (e) {
          logger.e(e);
        }
        break;
      default:
        super.onError(err, handler);
        break;
    }
  }

  Future<void> doRefreshToken() async {
    final String clientId = dotenv.env['CLIENT_ID.LOCAL'] ?? '';
    final String refreshToken = _sharedPreferences.getString('refresh_token');
    Map<String, dynamic> body = {
      'grant_type': 'refresh_token',
      'client_id': clientId,
      'refresh_token': refreshToken,
    };
    await _authenticationRepo.putAuth(await _authAPI.token(body));
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  Future<void> doLogOut() async {
    refreshCount = 0;
    await _authenticationRepo.clearAuth();
  }

  bool hasRefreshToken(String authorization) {
    refreshCount++;
    authorization = authorization.replaceAll('Bearer ', '');
    final String accessToken = _sharedPreferences.getString('access_token');
    return authorization != accessToken;
  }
}
