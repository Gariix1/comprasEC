import 'package:flutter/material.dart';

import 'clear_glass.dart';

class GlassTextField extends StatelessWidget {
  const GlassTextField({
    super.key,
    required this.hint,
    this.label,
    this.icon,
  });

  final String hint;
  final String? label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ClearGlass(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: icon != null ? Icon(icon) : null,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
