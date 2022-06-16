import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:do_core/models.dart';
import 'package:equatable/equatable.dart';
import 'package:satpol_dart/auth/authentication/services/authentication_service.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({required AuthenticationService authService})
      : _authService = authService,
        super(const AuthenticationState.unknown()) {
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
    _authenticationStatusSubscription = _authService.status.listen(
      (status) => add(AuthenticationStatusChanged(status)),
    );
  }

  final AuthenticationService _authService;
  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    _authService.dispose();
    return super.close();
  }

  void _onAuthenticationStatusChanged(AuthenticationStatusChanged event,
      Emitter<AuthenticationState> emit) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        emit(const AuthenticationState.unauthenticated());
        break;
      case AuthenticationStatus.authenticated:
        final oAuthResponse = _authService.getOAuthResponse();
        emit(oAuthResponse.accessToken.isNotEmpty
            ? AuthenticationState.authenticated(oAuthResponse)
            : const AuthenticationState.unauthenticated());
        break;
      default:
        emit(const AuthenticationState.unknown());
        break;
    }
  }

  void _onAuthenticationLogoutRequested(AuthenticationLogoutRequested event,
      Emitter<AuthenticationState> emit) async {
    await _authService.logOut();
  }
}
