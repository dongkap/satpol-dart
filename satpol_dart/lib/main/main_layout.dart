import 'package:do_common/common.dart';
import 'package:satpol_dart/main/tab_navigator.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const MainLayout());
  }

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> with TickerProviderStateMixin {
  AnimationController? animationController;

  List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      imagePath: 'assets/eva_icons/outline/svg/home-outline.svg',
      selectedImagePath: 'assets/eva_icons/fill/svg/home.svg',
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/eva_icons/outline/svg/book-outline.svg',
      selectedImagePath: 'assets/eva_icons/fill/svg/book-open.svg',
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/eva_icons/outline/svg/activity-outline.svg',
      selectedImagePath: 'assets/eva_icons/fill/svg/activity.svg',
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/eva_icons/outline/svg/person-outline.svg',
      selectedImagePath: 'assets/eva_icons/fill/svg/person.svg',
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];

  Map<String, GlobalKey<NavigatorState>> navigatorKeys = {
    TabNavigatorRoutes.home: GlobalKey<NavigatorState>(),
    TabNavigatorRoutes.exercise: GlobalKey<NavigatorState>(),
    TabNavigatorRoutes.uitemplate: GlobalKey<NavigatorState>(),
    TabNavigatorRoutes.profile: GlobalKey<NavigatorState>(),
  };

  String currentTab = TabNavigatorRoutes.home;

  @override
  void initState() {
    for (var tab in tabIconsList) {
      tab.isSelected = false;
    }
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 50), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            TabNavigator(
              navigatorKey: navigatorKeys[currentTab]!,
              animationController: animationController!,
              tab: currentTab,
            ),
            bottomBar()
          ],
        ),
      ),
    );
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarWidget(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            switch (index) {
              case 0:
                animationController?.reverse().then<dynamic>((data) {
                  if (!mounted) {
                    return;
                  }
                  setState(() {
                    currentTab = TabNavigatorRoutes.home;
                  });
                });
                break;
              case 1:
                animationController?.reverse().then<dynamic>((data) {
                  if (!mounted) {
                    return;
                  }
                  setState(() {
                    currentTab = TabNavigatorRoutes.exercise;
                  });
                });
                break;
              case 2:
                animationController?.reverse().then<dynamic>((data) {
                  if (!mounted) {
                    return;
                  }
                  setState(() {
                    currentTab = TabNavigatorRoutes.uitemplate;
                  });
                });
                break;
              case 3:
                animationController?.reverse().then<dynamic>((data) {
                  if (!mounted) {
                    return;
                  }
                  setState(() {
                    currentTab = TabNavigatorRoutes.profile;
                  });
                });
                break;
              default:
            }
          },
        ),
      ],
    );
  }
}
