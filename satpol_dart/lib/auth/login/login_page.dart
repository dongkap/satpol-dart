import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satpol_dart/auth/authentication/services/authentication_service.dart';
import 'package:satpol_dart/auth/login/bloc/login_bloc.dart';
import 'package:satpol_dart/auth/login/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(5.0),
        child: SizedBox.shrink(),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: BlocProvider(
          create: (context) {
            return LoginBloc(
              authService:
                  RepositoryProvider.of<AuthenticationService>(context),
            );
          },
          child: const LoginForm(),
        ),
      ),
    );
  }
}
