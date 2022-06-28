import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:do_core/interceptors/http_error_interceptors.dart';
import 'package:do_core/interceptors/http_language_interceptors.dart';
import 'package:do_core/interceptors/http_oauth_interceptors.dart';
import 'package:do_core/interceptors/http_signature_interceptors.dart';
import 'package:do_core/models/base_response.dart';
import 'package:do_core/models/profile_dto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_api.g.dart';

@RestApi()
abstract class ProfileAPI {
  factory ProfileAPI(Dio dio) {
    String baseUrl = dotenv.env['HOST.PROFILE'] ?? '';
    dio.options.receiveTimeout = 30000;
    dio.options.connectTimeout = 15000;
    dio.interceptors.add(HttpOAuthInterceptors());
    dio.interceptors.add(HttpSignatureInterceptors());
    dio.interceptors.add(HttpLanguageInterceptors());
    dio.interceptors.add(HttpErrorInterceptors(dio));
    return _ProfileAPI(dio, baseUrl: baseUrl);
  }

  @Headers({'content-type': 'application/json'})
  @GET('/api/security/002/vw/get/profile/v.1')
  Future<ProfileDto> getProfile();

  @Headers({'content-type': 'application/json'})
  @POST('/api/security/002/trx/post/profile/v.1')
  Future<BaseResponse> putProfile(@Body() ProfileDto profile);

  @Headers({'content-type': 'image/png'})
  @GET('/api/security/002/vw/get/photo-profile/v.1/{imageUUID}')
  Future<HttpResponse> getPhotoProfile(@Path() String imageUUID);

  @Headers({'content-type': 'multipart/form-data'})
  @POST('/api/security/002/trx/post/photo-profile/v.1')
  Future<BaseResponse> putPhotoProfile(@Part(name: 'photo') File photo);
}
