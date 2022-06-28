import 'package:flutter/material.dart';
import 'package:satpol_dart/main/home/home_page.dart';
import 'package:satpol_dart/main/profile/profile_page.dart';
import 'package:satpol_dart/main/sample/my_diary_page.dart';
import 'package:satpol_dart/main/sample/training_page.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String home = '/home';
  static const String exercise = '/exercise';
  static const String uitemplate = '/uitemplate';
  static const String profile = '/profile';
}

class TabNavigator extends StatefulWidget {
  const TabNavigator(
      {Key? key,
      required this.navigatorKey,
      required this.tab,
      required this.animationController})
      : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;
  final String tab;
  final AnimationController animationController;

  @override
  State<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      TabNavigatorRoutes.root: (context) =>
          HomePage(animationController: widget.animationController),
      TabNavigatorRoutes.home: (context) =>
          HomePage(animationController: widget.animationController),
      TabNavigatorRoutes.exercise: (context) =>
          MyDiaryPage(animationController: widget.animationController),
      TabNavigatorRoutes.uitemplate: (context) =>
          TrainingPage(animationController: widget.animationController),
      TabNavigatorRoutes.profile: (context) => ProfilePage(
          animationController: widget.animationController,
          navigatorState: getNavigatorState()),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: widget.navigatorKey,
      initialRoute: widget.tab,
      onGenerateRoute: (routeSettings) {
        if (widget.tab == routeSettings.name) {
          return MaterialPageRoute<dynamic>(
            builder: (BuildContext context) =>
                routeBuilders[routeSettings.name]!(context),
          );
        }
        return null;
      },
    );
  }

  NavigatorState getNavigatorState() {
    return Navigator.of(context);
  }
}
