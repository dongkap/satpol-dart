import 'package:do_common/common.dart';
import 'package:do_core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:satpol_dart/auth/login/bloc/login_bloc.dart';
import 'package:satpol_dart/generated/l10n.dart';
import 'package:satpol_dart/l10n/utils/locale_utils.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key, required this.controller}) : super(key: key);

  final AnimationController controller;
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  int progress = 0;

  void progressCount() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    progress++;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          Flushbar(
            messageText: Text(
              LocaleUtils.translate(
                  LocaleUtils.translate(StringUtils.toCamelCase(state.error))),
              style: const TextStyle(color: Colors.white),
            ),
            icon: SvgPicture.asset(
                'assets/eva_icons/outline/svg/alert-triangle-outline.svg',
                color: Palette.lightColor),
            duration: const Duration(seconds: 3),
            backgroundColor: Palette.lightDanger,
            isDismissible: false,
            dismissDirection: FlushbarDismissDirection.VERTICAL,
          ).show(context);
          widget.controller.value = 0;
          widget.controller.duration = const Duration(seconds: 5);
          widget.controller.stop();
        } else if (state.status.isSubmissionInProgress) {
          widget.controller.forward();
        } else if (state.status.isSubmissionSuccess) {
          widget.controller.value = 1;
          widget.controller.duration = const Duration(seconds: 5);
          widget.controller.stop();
        }
      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20.0),
                  _TitleLabel(),
                  const SizedBox(height: 8.0),
                  _SubtitleLabel(),
                  const SizedBox(height: 35.0),
                  _UsernameInput(),
                  const SizedBox(height: 8.0),
                  _ForgotPasswordLabel(),
                  _PasswordInput(),
                  const SizedBox(height: 24.0),
                  _LoginButton(),
                  _AdditionalTitleLabel(),
                  const SizedBox(height: 20.0),
                  _GoogleLogin(),
                  const SizedBox(height: 20.0),
                  _RegisterLink(),
                  const SizedBox(height: 35.0),
                  _TermsConditionLink()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextFormField(
          key: const Key('loginform_username'),
          keyboardType: TextInputType.emailAddress,
          autofocus: true,
          readOnly: state.status.isSubmissionInProgress,
          decoration: InputDecoration(
            labelText: DongkapLocalizations.of(context).labelUsernameEmail,
            hintText: DongkapLocalizations.of(context).hintUsernameEmail,
            contentPadding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
            errorText: state.username.invalid
                ? DongkapLocalizations.of(context).errorUsername
                : null,
          ),
          onChanged: (username) =>
              context.read<LoginBloc>().add(LoginUsernameChanged(username)),
        );
      },
    );
  }
}

class _PasswordInput extends StatefulWidget {
  @override
  __PasswordInputState createState() => __PasswordInputState();
}

class __PasswordInputState extends State<_PasswordInput> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
            key: const Key('loginForm_password'),
            autofocus: false,
            readOnly: state.status.isSubmissionInProgress,
            decoration: InputDecoration(
              labelText: DongkapLocalizations.of(context).password,
              hintText: DongkapLocalizations.of(context).password,
              contentPadding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
              errorText: state.password.invalid
                  ? DongkapLocalizations.of(context).errorPassword
                  : null,
              suffixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isObscureText = !isObscureText;
                    });
                  },
                  child: isObscureText
                      ? SvgPicture.asset(
                          'assets/eva_icons/outline/svg/eye-outline.svg',
                          color: Theme.of(context)
                              .iconTheme
                              .color
                              ?.withOpacity(0.5))
                      : SvgPicture.asset(
                          'assets/eva_icons/outline/svg/eye-off-outline.svg',
                          color: Theme.of(context)
                              .iconTheme
                              .color
                              ?.withOpacity(0.5)),
                ),
              ),
            ),
            obscureText: isObscureText,
            onChanged: (password) =>
                context.read<LoginBloc>().add(LoginPasswordChanged(password)));
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.action != current.action,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
              child: ElevatedButton(
                onPressed: (!state.action.isValidated ||
                        state.status.isSubmissionInProgress ||
                        state.status.isSubmissionSuccess)
                    ? null
                    : () {
                        context.read<LoginBloc>().add(const LoginSubmitted());
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                style: ElevatedButton.styleFrom(
                  primary: Palette.colorTheme,
                  minimumSize: const Size(200.0, 48.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      DongkapLocalizations.of(context).login.toUpperCase(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: (state.status.isSubmissionInProgress ||
                                state.action.isInvalid ||
                                state.action.isPure)
                            ? Palette.buttonTextDisable
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class _TitleLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        DongkapLocalizations.of(context).login,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _SubtitleLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        DongkapLocalizations.of(context).labelLogin,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class _ForgotPasswordLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 6),
      child: Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          canRequestFocus: false,
          child: Text(
            '${DongkapLocalizations.of(context).forgotPassword}?',
          ),
          onTap: () {},
        ),
      ),
    );
  }
}

class _AdditionalTitleLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        '${DongkapLocalizations.of(context).labelFooterLoginSocial} :',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class _GoogleLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      focusNode: FocusNode(skipTraversal: true),
      icon: SvgPicture.asset(
        'assets/eva_icons/fill/svg/google.svg',
        color: Palette.colorTheme,
      ),
      onPressed: () {},
    );
  }
}

class _RegisterLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 2),
                child: Text(
                  DongkapLocalizations.of(context).labelFooterLoginOther,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                )),
            InkWell(
              onTap: () {},
              canRequestFocus: false,
              child: Text(
                DongkapLocalizations.of(context).register,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Palette.colorTheme,
                  decoration: TextDecoration.underline,
                ),
              ),
            )
          ]),
    );
  }
}

class _TermsConditionLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      child: InkWell(
        onTap: () {},
        canRequestFocus: false,
        child: Text(
          DongkapLocalizations.of(context).termsAndConditions,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Palette.colorTheme,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
