import 'dart:io';
import 'package:do_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:satpol_dart/auth/login/view/login_page.dart';
import 'package:satpol_dart/generated/l10n.dart';

class DongkapApp extends StatefulWidget {
  const DongkapApp({Key? key}) : super(key: key);

  @override
  State<DongkapApp> createState() => _DongkapAppState();
}

class _DongkapAppState extends State<DongkapApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  static const List<Locale> supportedLocales = <Locale>[
    Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
    Locale.fromSubtags(languageCode: 'id', countryCode: 'ID'),
  ];
  Locale localeDefault =
      const Locale.fromSubtags(languageCode: 'en', countryCode: 'US');

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      navigatorKey: _navigatorKey,
      title: 'Dongkap',
      debugShowCheckedModeBanner: false,
      theme: Palette.light,
      darkTheme: Palette.dark,
      localizationsDelegates: const [
        DongkapLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: supportedLocales,
      home: const LoginPage(),
    );
  }
}
