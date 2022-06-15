import 'package:bloc/bloc.dart';
import 'package:do_common/common.dart';
import 'package:do_core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:satpol_dart/auth/authentication/services/authentication_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationService authService,
  })  : _authService = authService,
        super(const LoginState()) {
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  final AuthenticationService _authService;

  void _onUsernameChanged(
    LoginUsernameChanged event,
    Emitter<LoginState> emit,
  ) {
    final username = Username.dirty(event.username);
    emit(state.copyWith(
      username: username,
      action: Formz.validate([state.password, username]),
      status: FormzStatus.pure,
      error: null,
    ));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password,
      action: Formz.validate([password, state.username]),
      status: FormzStatus.pure,
      error: null,
    ));
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.action.isValidated) {
      emit(state.copyWith(
          status: FormzStatus.submissionInProgress,
          action: FormzStatus.submissionInProgress));
      try {
        await _authService.logIn(
          username: state.username.value,
          password: state.password.value,
        );
        emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          action: FormzStatus.submissionSuccess,
          error: null,
        ));
      } on ServerError catch (err) {
        emit(state.copyWith(
          error: err.getErrorMessage(),
          action: FormzStatus.submissionFailure,
          status: FormzStatus.submissionFailure,
        ));
      }
    }
  }
}
