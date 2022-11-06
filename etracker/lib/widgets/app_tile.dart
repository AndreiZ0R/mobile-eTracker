import 'package:flutter/material.dart';

import '../theming/app_dimms.dart';
import '../theming/app_theme.dart';
import 'icon_button.dart';

class AppTile extends StatelessWidget {
  final Color backgroundColor;
  final Color labelColor;
  final Color iconColor;
  final Color iconBackgroundColor;
  final String placeHolder;
  final VoidCallback? onTap;

  const AppTile({
    this.onTap,
    this.backgroundColor = AppTheme.backgroundColorWhite,
    this.labelColor = AppTheme.primaryColor,
    this.iconColor = AppTheme.primaryAccent,
    this.iconBackgroundColor = AppTheme.backgroundColorWhite,
    required this.placeHolder,
    Key? key,
    // required this.home,
  }) : super(key: key);

  // Color _getStatusColor(BuildContext context) =>
  //     home.status == HomeStatus.locked
  //         ? Theme.of(context).colorScheme.secondary
  //         : Theme.of(context).colorScheme.error;

  // IconData get statusIcon => home.status == HomeStatus.locked
  //     ? Icons.chevron_right_rounded
  //     : Icons.report_outlined;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppDimms.defaultElevation,
      color: backgroundColor,
      // margin:
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppDimms.defaultBorderRadius),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(
          AppDimms.defaultPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  placeHolder,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: labelColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            AppIconButton(
              backgroundColor: iconBackgroundColor,
              color: iconColor,
              onTap: onTap ?? () {},
              icon: Icons.chevron_right_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
