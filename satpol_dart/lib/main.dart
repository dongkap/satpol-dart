import 'dart:io';

import 'package:do_core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:satpol_dart/dongkap_app.dart';

void main() async {
  HttpOverrides.global = CustomHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(const DongkapApp()));
}
