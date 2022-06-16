import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpBasicInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String clientId = dotenv.env['CLIENT_ID.LOCAL'] ?? '';
    String clientSecret = dotenv.env['CLIENT_SECRET.LOCAL'] ?? '';
    final String authorization =
        base64Encode(utf8.encode('$clientId:$clientSecret'));
    options.headers['authorization'] = 'Basic $authorization';
    super.onRequest(options, handler);
  }
}
