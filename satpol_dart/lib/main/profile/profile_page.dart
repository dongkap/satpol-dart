import 'package:do_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:satpol_dart/generated/l10n.dart';
import 'package:satpol_dart/main/profile/widgets/profile_layout_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, this.animationController, this.navigatorState})
      : super(key: key);

  final AnimationController? animationController;
  final NavigatorState? navigatorState;
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  double _topBarOpacity = 0.0;
  final int _itemTotal = 3;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.offset >= 24) {
        if (_topBarOpacity != 1.0) {
          setState(() {
            _topBarOpacity = 1.0;
          });
        }
      } else if (_scrollController.offset <= 24 &&
          _scrollController.offset >= 0) {
        if (_topBarOpacity != _scrollController.offset / 24) {
          setState(() {
            _topBarOpacity = _scrollController.offset / 24;
          });
        }
      } else if (_scrollController.offset <= 0) {
        if (_topBarOpacity != 0.0) {
          setState(() {
            _topBarOpacity = 0.0;
          });
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        appBar: appBar(),
        body: Stack(
          children: <Widget>[
            mainView(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget mainView() {
    return RefreshIndicator(
      backgroundColor: Theme.of(context).dialogTheme.backgroundColor,
      color: Palette.colorTheme,
      strokeWidth: 3,
      child: ProfileLayoutWidget(
          itemTotal: _itemTotal,
          scrollController: _scrollController,
          animationController: widget.animationController,
          navigatorState: widget.navigatorState),
      onRefresh: () async {},
    );
  }

  PreferredSizeWidget appBar() {
    return AppBarWidget(
      animationController: widget.animationController,
      topBarOpacity: _topBarOpacity,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              DongkapLocalizations.of(context).account,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 22 + 6 - 6 * _topBarOpacity,
                color: Theme.of(context).appBarTheme.titleTextStyle!.color,
                fontFamily:
                    Theme.of(context).appBarTheme.titleTextStyle!.fontFamily,
                fontWeight:
                    Theme.of(context).appBarTheme.titleTextStyle!.fontWeight,
                letterSpacing:
                    Theme.of(context).appBarTheme.titleTextStyle!.letterSpacing,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            height: 40,
            width: 40,
            child: InkWell(
              highlightColor: Palette.darkGrey.withOpacity(0.2),
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              onTap: () {
                _modalBottomSheetMenu(context);
              },
              child: Center(
                child: SvgPicture.asset(
                  'assets/eva_icons/outline/svg/menu-2-outline.svg',
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _modalBottomSheetMenu(BuildContext context) async {
    await showModalBottomSheet(
        useRootNavigator: true,
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return Container(
            height: 300.0,
            color: Colors.transparent,
            child: Card(
              color: Theme.of(context).bottomSheetTheme.backgroundColor,
              shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
              ),
              borderOnForeground: true,
              elevation: 0,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.center,
                    child: Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: SvgPicture.asset(
                      'assets/eva_icons/outline/svg/settings-outline.svg',
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: Text(
                      DongkapLocalizations.of(context).settings,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    horizontalTitleGap: 2,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20.0),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: SvgPicture.asset(
                      'assets/eva_icons/outline/svg/lock-outline.svg',
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: Text(
                      DongkapLocalizations.of(context).security,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    horizontalTitleGap: 2,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20.0),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: SvgPicture.asset(
                      'assets/eva_icons/outline/svg/info-outline.svg',
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: Text(
                      DongkapLocalizations.of(context).about,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    horizontalTitleGap: 2,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20.0),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: SvgPicture.asset(
                      'assets/eva_icons/outline/svg/power-outline.svg',
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: Text(
                      DongkapLocalizations.of(context).logout,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    horizontalTitleGap: 2,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20.0),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                ],
              ),
            ),
          );
        });
  }
}
