import 'dart:convert';

import 'package:dio/dio.dart' hide Headers;
import 'package:do_core/models/base_response.dart';

class ServerError implements Exception {
  ServerError({required String error}) {
    _errorMessage = error;
  }

  ServerError.withError({required DioError error}) {
    _handleError(error);
  }

  String _errorMessage = '';

  String getErrorMessage() {
    return _errorMessage;
  }

  _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        _errorMessage = 'errorDioCancel';
        break;
      case DioErrorType.connectTimeout:
        _errorMessage = 'errorDioConnectTimeout';
        break;
      case DioErrorType.receiveTimeout:
        _errorMessage = 'errorDioReceiveTimeout';
        break;
      case DioErrorType.sendTimeout:
        _errorMessage = 'errorDioSendTimeout';
        break;
      case DioErrorType.other:
        _errorMessage = 'errorDioDefault';
        break;
      case DioErrorType.response:
        BaseResponse _errorResponse = BaseResponse.fromJson(
            (error.response?.data is List<int>)
                ? json.decode(utf8.decode(error.response?.data))
                : error.response?.data);
        if (_errorResponse.respStatusCode.isNotEmpty) {
          _errorMessage =
              _errorResponse.respStatusMessage[_errorResponse.respStatusCode];
          if (_errorResponse.respStatusMessage['invalid_token'] != null) {
            _errorMessage = 'ERR_401';
          }
        } else {
          _errorMessage = 'ERR_${error.response?.statusCode}';
        }
        break;
    }
    return _errorMessage;
  }

  @override
  String toString() {
    return _errorMessage;
  }
}
