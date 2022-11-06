import 'package:flutter/material.dart';

import '../theming/app_dimms.dart';
import '../theming/app_theme.dart';

class CarouselWrapper extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final Color? backgroundColor;

  const CarouselWrapper(
      {required this.onTap,
      Key? key,
      required this.child,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        child: Container(
          color: backgroundColor ?? AppTheme.backgroundColorWhite,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              AppDimms.defaultBorderRadius,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
