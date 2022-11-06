import 'package:etracker/theming/app_dimms.dart';
import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color color;
  final Color backgroundColor;
  final bool hasElevation;

  const AppIconButton(
      {this.backgroundColor = Colors.white,
      this.color = Colors.black,
      this.hasElevation = true,
      required this.icon,
      required this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(
        AppDimms.defaultBorderRadius,
      ),
      elevation: hasElevation ? AppDimms.defaultElevation : 0,
      child: InkWell(
        borderRadius: BorderRadius.circular(
          AppDimms.defaultBorderRadius,
        ),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppDimms.xsPadding, horizontal: AppDimms.mediumPadding),
          child: Icon(
            icon,
            color: color,
          ),
        ),
      ),
    );
  }
}
