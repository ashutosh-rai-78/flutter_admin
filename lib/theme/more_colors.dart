import 'package:flutter/material.dart';

extension MoreColors on ColorScheme {
  Color get textPrimary => onSurface;
  Color get textSecondary => onSurface.withOpacity(0.7);
  Color get textTertiary => onSurface.withOpacity(0.4);
  Color get clickable => secondaryContainer.withOpacity(0.5);
}
