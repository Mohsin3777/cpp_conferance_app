import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

class NotificationIconWithDot extends StatelessWidget {
  Color? iconColor;
  NotificationIconWithDot({
    this.iconColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: badges.Badge(
        position: badges.BadgePosition.custom(
          bottom: 20,
          top: 10,
          end: 1,
        ),
        badgeContent: const Text(''),
        child: Icon(
          Icons.notifications_outlined,
          color: iconColor ?? Colors.white,
          size: 25,
        ),
      ),
    );
  }
}
