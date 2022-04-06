import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:satpol_dart/dongkap_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(const DongkapApp()));
}
