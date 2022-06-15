import 'dart:async';

import 'package:dio/dio.dart';
import 'package:do_core/core.dart';
import 'package:do_core/models.dart';
import 'package:logger/logger.dart';

class AuthenticationService {
  final AuthenticationRepository _authenticationRepo =
      coreLocator<AuthenticationRepository>();
  final logger = Logger();
  final _controller = StreamController<AuthenticationStatus>();
  AuthAPI? _authAPI;

  Stream<AuthenticationStatus> get status async* {
    if (_authenticationRepo.status) {
      yield AuthenticationStatus.authenticated;
    } else {
      yield AuthenticationStatus.unauthenticated;
    }
    yield* _controller.stream;
  }

  OAuthResponse getOAuthResponse() {
    return _authenticationRepo.getAuth();
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    String clientId = 'smart-mobile';
    Map<String, dynamic> body = {
      'grant_type': 'password',
      'client_id': clientId,
      'username': username,
      'password': password
    };
    _authAPI = AuthAPI(Dio());
    await _authAPI?.token(body).then((value) async {
      await _authenticationRepo.putAuth(value).then((value) {
        _controller.add(AuthenticationStatus.authenticated);
        logger.i(_authenticationRepo.getAuth());
      });
    }).catchError((Object obj) {
      if (obj.runtimeType == DioError) {
        final error = ServerError.withError(error: obj as DioError);
        throw error;
      }
    });
  }

  Future<void> logOut() async {
    _controller.add(AuthenticationStatus.unauthenticated);
    await _authenticationRepo.clearAuth();
  }

  void dispose() => _controller.close();
}
