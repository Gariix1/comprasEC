import 'package:flutter/material.dart';

/// Reusable list tile with icon, title, subtitle and optional trailing.
class AppListTile extends StatelessWidget {
  const AppListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.leading,
    this.subtitleWidget,
    this.trailing,
    this.semanticLabel,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Widget? leading;
  final Widget? subtitleWidget;
  final Widget? trailing;
  final String? semanticLabel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: leading ??
          Semantics(
            label: semanticLabel ?? title,
            child: Icon(icon),
          ),
      title: Text(title),
      subtitle: subtitleWidget ?? Text(subtitle),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
