part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.oAuthResponse = OAuthResponse.empty,
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(OAuthResponse oAuthResponse)
      : this._(
            status: AuthenticationStatus.authenticated,
            oAuthResponse: oAuthResponse);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final OAuthResponse oAuthResponse;

  @override
  List<Object> get props => [status];
}
