import 'package:flutter/material.dart';

import '../../../../core/widgets/clear_glass.dart';

class TrackingStatusTile extends StatelessWidget {
  const TrackingStatusTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.trailing,
    this.iconColor,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String trailing;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return ClearGlass(
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text(
          trailing,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
