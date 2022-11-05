import 'package:flutter/material.dart';

import '../theming/app_dimms.dart';
import '../theming/app_theme.dart';

class AppCard extends StatelessWidget {
  final Widget child;

  const AppCard({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppDimms.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppDimms.defaultBorderRadius,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          AppDimms.defaultBorderRadius,
        ),
        child: child,
      ),
    );
  }
}
