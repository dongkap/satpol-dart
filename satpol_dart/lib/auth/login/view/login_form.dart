import 'package:do_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:satpol_dart/generated/l10n.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
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
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const Key('loginform_username'),
      keyboardType: TextInputType.emailAddress,
      autofocus: true,
      decoration: InputDecoration(
        labelText: DongkapLocalizations.of(context).labelUsernameEmail,
        hintText: DongkapLocalizations.of(context).hintUsernameEmail,
        contentPadding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
        errorText: DongkapLocalizations.of(context).errorUsername,
      ),
      onChanged: (username) => {},
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
    return TextFormField(
      key: const Key('loginForm_password'),
      autofocus: false,
      decoration: InputDecoration(
        labelText: DongkapLocalizations.of(context).password,
        hintText: DongkapLocalizations.of(context).password,
        contentPadding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
        errorText: DongkapLocalizations.of(context).errorPassword,
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
                    color: Theme.of(context).iconTheme.color?.withOpacity(0.5))
                : SvgPicture.asset(
                    'assets/eva_icons/outline/svg/eye-off-outline.svg',
                    color: Theme.of(context).iconTheme.color?.withOpacity(0.5)),
          ),
        ),
      ),
      obscureText: isObscureText,
      onChanged: (password) => {},
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child: ElevatedButton(
          onPressed: () => {},
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                DongkapLocalizations.of(context).login.toUpperCase(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
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
