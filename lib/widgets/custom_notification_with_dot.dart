import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

class NotificationIconWithDot extends StatelessWidget {
  const NotificationIconWithDot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: badges.Badge(
        position: badges.BadgePosition.custom(
          bottom: 0,
          top: 10,
          end: 1,
        ),
        badgeContent: const Text(''),
        child: const Icon(
          Icons.notifications_outlined,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }
}
