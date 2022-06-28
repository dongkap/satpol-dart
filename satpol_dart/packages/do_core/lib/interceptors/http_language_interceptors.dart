import 'package:dio/dio.dart';
import 'package:do_core/services/core_locator.dart';
import 'package:do_core/services/shared_preferences_service.dart';

class HttpLanguageInterceptors extends Interceptor {
  final SharedPreferencesService _sharedPreferences =
      coreLocator<SharedPreferencesService>();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['accept-language'] = _sharedPreferences.getString('locale');
    super.onRequest(options, handler);
  }
}
