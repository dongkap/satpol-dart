import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:do_core/interceptors/http_basic_interceptors.dart';
import 'package:do_core/models.dart';
import 'package:retrofit/http.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthAPI {
  factory AuthAPI(Dio dio) {
    String baseUrl = 'https://satpol-api-security.herokuapp.com';
    dio.options.receiveTimeout = 30000;
    dio.options.connectTimeout = 15000;
    dio.interceptors.add(HttpBasicInterceptors());
    return _AuthAPI(dio, baseUrl: baseUrl);
  }

  @Headers({'content-type': 'application/json'})
  @POST('/api/security/oauth/signup')
  Future<BaseResponse> signup(@Body() Map<String, dynamic> body);

  @Headers({'content-type': 'application/x-www-form-urlencoded'})
  @POST('/api/security/oauth/token')
  Future<OAuthResponse> token(@Body() Map<String, dynamic> body);

  @Headers({'content-type': 'application/x-www-form-urlencoded'})
  @POST('/api/security/oauth/token-verifier')
  Future<OAuthResponse> tokenVerifier(@Body() Map<String, dynamic> body);

  @Headers({'content-type': 'application/json'})
  @POST('/api/security/oauth/request-forgot-password')
  Future<BaseResponse> requestForgotPassword(@Body() Map<String, dynamic> body);

  @Headers({'content-type': 'application/json'})
  @POST('/api/security/oauth/verification-forgot-password')
  Future<BaseResponse> verificationForgotPassword(
      @Body() Map<String, dynamic> body);

  @Headers({'content-type': 'application/json'})
  @POST('/api/security/oauth/forgot-password')
  Future<BaseResponse> forgotPassword(@Body() Map<String, dynamic> body);
}
