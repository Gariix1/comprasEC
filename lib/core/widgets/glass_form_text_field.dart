import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';
import 'clear_glass.dart';

class GlassFormTextField extends StatelessWidget {
  const GlassFormTextField({
    super.key,
    required this.label,
    this.hint,
    this.icon,
    this.controller,
    this.keyboardType,
    this.errorText,
    this.helperText,
    this.obscureText = false,
  });

  final String label;
  final String? hint;
  final IconData? icon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? errorText;
  final String? helperText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return ClearGlass(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: icon != null ? Icon(icon) : null,
          errorText: errorText,
          helperText: helperText,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.sm,
          ),
        ),
      ),
    );
  }
}
