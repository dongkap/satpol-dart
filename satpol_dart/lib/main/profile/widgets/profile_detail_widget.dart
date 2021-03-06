import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:satpol_dart/generated/l10n.dart';

class ProfileDetailWidget extends StatelessWidget {
  const ProfileDetailWidget(
      {Key? key, this.animationController, this.animation})
      : super(key: key);

  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        String pdb = '';
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - animation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 16, bottom: 18),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardTheme.color,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(68.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Theme.of(context)
                            .cardTheme
                            .shadowColor!
                            .withOpacity(0.2),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 4, right: 24, top: 5, bottom: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            leading: SvgPicture.asset(
                                'assets/eva_icons/outline/svg/person-outline.svg',
                                color: Theme.of(context).iconTheme.color),
                            title: Text(
                              DongkapLocalizations.of(context).username,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .color,
                              ),
                            ),
                            subtitle: Text(
                              '',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .color!
                                    .withOpacity(0.5),
                              ),
                            ),
                            horizontalTitleGap: 5,
                            onTap: () {},
                          ),
                          ListTile(
                            leading: SvgPicture.asset(
                                'assets/eva_icons/outline/svg/phone-outline.svg',
                                color: Theme.of(context).iconTheme.color),
                            title: Text(
                              DongkapLocalizations.of(context).phoneNumber,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .color,
                              ),
                            ),
                            subtitle: Text(
                              '',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .color!
                                    .withOpacity(0.5),
                              ),
                            ),
                            horizontalTitleGap: 5,
                            onTap: () {},
                          ),
                          ListTile(
                            leading: SvgPicture.asset(
                                'assets/eva_icons/outline/svg/people-outline.svg',
                                color: Theme.of(context).iconTheme.color),
                            title: Text(
                              DongkapLocalizations.of(context).gender,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .color,
                              ),
                            ),
                            subtitle: Text(
                              '',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .color!
                                    .withOpacity(0.5),
                              ),
                            ),
                            horizontalTitleGap: 5,
                            onTap: () {},
                          ),
                          ListTile(
                            leading: SvgPicture.asset(
                                'assets/eva_icons/outline/svg/calendar-outline.svg',
                                color: Theme.of(context).iconTheme.color),
                            title: Text(
                              DongkapLocalizations.of(context).pdob,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .color,
                              ),
                            ),
                            subtitle: Text(
                              pdb,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .color!
                                    .withOpacity(0.5),
                              ),
                            ),
                            horizontalTitleGap: 5,
                            onTap: () {},
                          ),
                          ListTile(
                            leading: SvgPicture.asset(
                                'assets/eva_icons/outline/svg/home-outline.svg',
                                color: Theme.of(context).iconTheme.color),
                            title: Text(
                              DongkapLocalizations.of(context).address,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .color,
                              ),
                            ),
                            subtitle: Text(
                              '',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .color!
                                    .withOpacity(0.5),
                              ),
                            ),
                            horizontalTitleGap: 5,
                            onTap: () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
