import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).splashColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Image.asset(
          'assets/images/logo.png',
          width: 100.0,
        )),
      ),
    );
  }
}
