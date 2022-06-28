import 'package:do_common/models/tab_icon_data.dart';
import 'package:do_common/utils/hex_color.dart';
import 'package:do_common/widgets/bottom_bar/tab_icons_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget(
      {Key? key, this.tabIconsList, this.changeIndex, this.addClick})
      : super(key: key);

  final Function(int index)? changeIndex;
  final Function? addClick;
  final List<TabIconData>? tabIconsList;
  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animationController?.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        SizedBox(
          height: 62,
          child: AnimatedBuilder(
            animation: animationController!,
            builder: (BuildContext context, Widget? child) {
              return Transform(
                transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                child: PhysicalShape(
                  color: Theme.of(context)
                      .bottomNavigationBarTheme
                      .backgroundColor!,
                  elevation: 16.0,
                  clipper: TabClipper(
                      radius: Tween<double>(begin: 0.0, end: 1.0)
                              .animate(CurvedAnimation(
                                  parent: animationController!,
                                  curve: Curves.fastOutSlowIn))
                              .value *
                          38.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 62,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 8, right: 8, top: 4),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: TabIcons(
                                    tabIconData: widget.tabIconsList?[0],
                                    removeAllSelect: () {
                                      setRemoveAllSelection(
                                          widget.tabIconsList?[0]);
                                      widget.changeIndex!(0);
                                    }),
                              ),
                              Expanded(
                                child: TabIcons(
                                    tabIconData: widget.tabIconsList?[1],
                                    removeAllSelect: () {
                                      setRemoveAllSelection(
                                          widget.tabIconsList?[1]);
                                      widget.changeIndex!(1);
                                    }),
                              ),
                              SizedBox(
                                width: Tween<double>(begin: 0.0, end: 1.0)
                                        .animate(CurvedAnimation(
                                            parent: animationController!,
                                            curve: Curves.fastOutSlowIn))
                                        .value *
                                    64.0,
                              ),
                              Expanded(
                                child: TabIcons(
                                    tabIconData: widget.tabIconsList?[2],
                                    removeAllSelect: () {
                                      setRemoveAllSelection(
                                          widget.tabIconsList?[2]);
                                      widget.changeIndex!(2);
                                    }),
                              ),
                              Expanded(
                                child: TabIcons(
                                    tabIconData: widget.tabIconsList?[3],
                                    removeAllSelect: () {
                                      setRemoveAllSelection(
                                          widget.tabIconsList?[3]);
                                      widget.changeIndex!(3);
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).padding.bottom,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
          child: SizedBox(
            width: 38 * 2.0,
            height: 38 + 62.0,
            child: Container(
              alignment: Alignment.topCenter,
              color: Colors.transparent,
              child: SizedBox(
                width: 38 * 2.0,
                height: 38 * 2.0,
                child: Padding(
                  padding: const EdgeInsets.all(9.5),
                  child: ScaleTransition(
                    alignment: Alignment.center,
                    scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                            parent: animationController!,
                            curve: Curves.fastOutSlowIn)),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .floatingActionButtonTheme
                            .backgroundColor,
                        gradient: LinearGradient(
                            colors: [
                              Theme.of(context)
                                  .floatingActionButtonTheme
                                  .backgroundColor!,
                              HexColor('#3366ff'),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        shape: BoxShape.circle,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Theme.of(context)
                                  .cardTheme
                                  .shadowColor!
                                  .withOpacity(0.6),
                              offset: const Offset(1.1, 1.1),
                              blurRadius: 10.0),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.white.withOpacity(0.1),
                          highlightColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          onTap: () {
                            widget.addClick!();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.5),
                            child: SvgPicture.asset(
                                'assets/eva_icons/fill/svg/shield.svg',
                                color: Theme.of(context)
                                    .floatingActionButtonTheme
                                    .foregroundColor,
                                fit: BoxFit.contain),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void setRemoveAllSelection(TabIconData? tabIconData) {
    if (!mounted) return;
    setState(() {
      widget.tabIconsList?.forEach((TabIconData tab) {
        tab.isSelected = false;
        if (tabIconData!.index == tab.index) {
          tab.isSelected = true;
        }
      });
    });
  }
}
