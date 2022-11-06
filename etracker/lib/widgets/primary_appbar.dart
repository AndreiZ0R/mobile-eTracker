import 'package:flutter/material.dart';

import '../theming/app_dimms.dart';
import '../theming/app_theme.dart';
import 'icon_button.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool hasBackButton;
  final String bigLabel;
  final String? smallLabel;
  final Color? backGroundColor;
  final TextStyle? customTitleStyle;
  final Color? customIconColor;

  var prefSize;

  PrimaryAppBar({
    required this.hasBackButton,
    required this.bigLabel,
    Key? key,
    this.customTitleStyle,
    this.smallLabel,
    this.backGroundColor,
    this.customIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDimms.xxsPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (hasBackButton) getBackButton(context),
            getMiddlePiece(context),
            if (hasBackButton) getFakeButton(context),
          ],
        ),
      ),
      backgroundColor: AppTheme.backgroundColorWhite,
      centerTitle: true,
    );
  }

  Widget getMiddlePiece(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            bigLabel,
            style: customTitleStyle ??
                Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.secondaryColor,
                    ),
          ),
          if (smallLabel != null)
            Text(
              smallLabel!,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppTheme.secondaryColor,
                  ),
            ),
        ],
      );

  Widget getBackButton(BuildContext context) => AppIconButton(
        hasElevation: false,
        icon: Icons.arrow_back,
        onTap: () {
          Navigator.pop(context);
        },
        color: customIconColor ?? AppTheme.secondaryColor,
        backgroundColor: backGroundColor ?? AppTheme.backgroundColorWhite,
      );

  Widget getFakeButton(BuildContext context) => AppIconButton(
        hasElevation: false,
        icon: Icons.arrow_back,
        onTap: () {},
        color: AppTheme.backgroundColorWhite,
        backgroundColor: backGroundColor ?? AppTheme.backgroundColorWhite,
      );

  @override
  Size get preferredSize => Size(56.0, 56.0);
}
