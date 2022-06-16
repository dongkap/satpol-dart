import 'package:do_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satpol_dart/auth/authentication/services/authentication_service.dart';
import 'package:satpol_dart/auth/login/bloc/login_bloc.dart';
import 'package:satpol_dart/auth/login/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(5.0),
        child: LinearProgressIndicator(
          value: controller.value,
          minHeight: 1.0,
          color: Palette.colorTheme,
        ),
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
          child: LoginForm(controller: controller),
        ),
      ),
    );
  }
}
