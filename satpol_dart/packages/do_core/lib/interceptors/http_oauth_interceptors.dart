import 'package:dio/dio.dart';
import 'package:do_core/services/core_locator.dart';
import 'package:do_core/services/shared_preferences_service.dart';

class HttpOAuthInterceptors extends Interceptor {
  final SharedPreferencesService _sharedPreferences =
      coreLocator<SharedPreferencesService>();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final String authorization = _sharedPreferences.getString('access_token');
    options.headers['authorization'] = 'Bearer $authorization';
    super.onRequest(options, handler);
  }
}
