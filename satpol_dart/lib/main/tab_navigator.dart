import 'package:flutter/material.dart';
import 'package:satpol_dart/main/my_diary/my_diary_page.dart';
import 'package:satpol_dart/main/training/training_page.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String diary = '/diary';
  static const String training = '/training';
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
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      TabNavigatorRoutes.root: (context) =>
          MyDiaryPage(animationController: widget.animationController),
      TabNavigatorRoutes.diary: (context) =>
          MyDiaryPage(animationController: widget.animationController),
      TabNavigatorRoutes.training: (context) =>
          TrainingPage(animationController: widget.animationController),
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
