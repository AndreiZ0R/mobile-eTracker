import 'package:flutter/material.dart';

import '../theming/app_dimms.dart';
import '../theming/app_theme.dart';

class AppTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color? color;
  final Color? labelColor;

  const AppTextButton(
      {required this.label,
      required this.onTap,
      this.color,
      this.labelColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? AppTheme.primaryColor,
      borderRadius: BorderRadius.circular(
        AppDimms.defaultBorderRadius,
      ),
      elevation: AppDimms.defaultElevation,
      child: InkWell(
        borderRadius: BorderRadius.circular(
          AppDimms.defaultBorderRadius,
        ),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppDimms.xsPadding, horizontal: AppDimms.mediumPadding),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimms.xxsPadding,
            ),
            child: Text(
              label,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: labelColor ?? AppTheme.backgroundColorWhite,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
