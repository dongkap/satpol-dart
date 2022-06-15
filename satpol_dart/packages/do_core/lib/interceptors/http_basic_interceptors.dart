import 'dart:convert';

import 'package:dio/dio.dart';

class HttpBasicInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String clientId = 'smart-mobile';
    String clientSecret = 'secretdo02';
    final String authorization =
        base64Encode(utf8.encode('$clientId:$clientSecret'));
    options.headers['authorization'] = 'Basic $authorization';
    super.onRequest(options, handler);
  }
}
