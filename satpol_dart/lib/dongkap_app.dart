import 'dart:io';

import 'package:do_common/common.dart';
import 'package:do_core/core.dart';
import 'package:do_core/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:satpol_dart/auth/authentication/bloc/authentication_bloc.dart';
import 'package:satpol_dart/auth/authentication/services/authentication_service.dart';
import 'package:satpol_dart/auth/login/login_page.dart';
import 'package:satpol_dart/generated/l10n.dart';
import 'package:satpol_dart/l10n/bloc/translation_bloc.dart';
import 'package:satpol_dart/main/main_layout.dart';
import 'package:satpol_dart/splash/page/splash_page.dart';
import 'package:satpol_dart/theme/bloc/theme_mode_bloc.dart';

class DongkapApp extends StatelessWidget {
  const DongkapApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationService>(
          create: (_) => AuthenticationService(),
        ),
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider<AuthenticationBloc>(
          create: (_) => AuthenticationBloc(
              authService: RepositoryProvider.of<AuthenticationService>(_)),
        ),
        BlocProvider<TranslationBloc>(
          create: (_) => TranslationBloc()..add(const TranslationChanged()),
        ),
        BlocProvider<ThemeModeBloc>(
          create: (_) => ThemeModeBloc()..add(const ThemeModeChanged()),
        ),
      ], child: const DongkapAppView()),
    );
  }
}

class DongkapAppView extends StatefulWidget {
  const DongkapAppView({Key? key}) : super(key: key);

  @override
  State<DongkapAppView> createState() => _DongkapAppState();
}

class _DongkapAppState extends State<DongkapAppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState? get _navigator => _navigatorKey.currentState;

  String appsName = dotenv.env['APPS_NAME'] ?? 'Dongkap';
  bool isDebugMode = dotenv.env['DEBUG_MODE'] == 'true' ? true : false;
  final List<Locale> supportedLocales = LocaleStatic().supportedLocales;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationBloc, TranslationState>(
      builder: (BuildContext context, TranslationState state) {
        return BlocBuilder<ThemeModeBloc, ThemeModeState>(
          builder: (BuildContext context, ThemeModeState themeState) {
            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness:
                  themeState.darkMode ? Brightness.light : Brightness.dark,
              statusBarBrightness:
                  Platform.isAndroid ? Brightness.dark : Brightness.light,
              systemNavigationBarColor: Colors.white,
              systemNavigationBarDividerColor: Colors.grey,
              systemNavigationBarIconBrightness: Brightness.dark,
            ));
            return MaterialApp(
              navigatorKey: _navigatorKey,
              title: appsName,
              debugShowCheckedModeBanner: isDebugMode,
              theme: Palette.light,
              darkTheme: Palette.dark,
              themeMode: themeState.themeMode,
              localizationsDelegates: const [
                DongkapLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: supportedLocales,
              locale: state.locale,
              builder: (context, child) {
                return BlocListener<AuthenticationBloc, AuthenticationState>(
                  listener: (context, state) {
                    switch (state.status) {
                      case AuthenticationStatus.authenticated:
                        _navigator?.pushAndRemoveUntil<void>(
                          MainLayout.route(),
                          (route) => false,
                        );
                        break;
                      default:
                        _navigator?.pushAndRemoveUntil<void>(
                          LoginPage.route(),
                          (route) => false,
                        );
                        break;
                    }
                  },
                  child: child,
                );
              },
              onGenerateRoute: (_) => SplashPage.route(),
            );
          },
        );
      },
    );
  }
}

Future<void> setupLocator() async {
  await setupCoreLocator();
}
