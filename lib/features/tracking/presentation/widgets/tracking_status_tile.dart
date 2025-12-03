import 'package:flutter/material.dart';

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
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(subtitle, maxLines: 2, overflow: TextOverflow.ellipsis),
        trailing: Text(
          trailing,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.right,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
