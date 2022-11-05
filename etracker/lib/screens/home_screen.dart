import 'package:etracker/theming/app_assets.dart';
import 'package:etracker/theming/app_dimms.dart';
import 'package:etracker/widgets/AppTextButton.dart';
import 'package:etracker/widgets/app_card.dart';
import 'package:etracker/widgets/app_tile.dart';
import 'package:etracker/widgets/icon_button.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../theming/app_theme.dart';
import '../widgets/user_card.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String js = '{"name": "John", "email": "johnjohn@"}';

  final _user = const User(
    address: 'Constantin Brancusi 175-177',
    companyName: 'Q_Perior',
    countryPrefix: 40,
    fullName: 'Andrei Borza',
    id: 1,
    phone: 727752379,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppTheme.primaryColor,
              AppTheme.secondaryColor,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(
                AppDimms.bigPadding,
              ),
              child: _HomeScreenHeader(user: _user),
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppDimms.xxlPadding),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(
                    AppDimms.bigPadding,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)!.homeScreenWouldText,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                color: AppTheme.backgroundColorWhite,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: AppTheme.backgroundColorWhite,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(
                      AppDimms.homeScreenBorderRadius,
                    ),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context)!.homeScreenWouldText,
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: AppTheme.primaryColor,
                                
                              ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  dynamic get cont => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('What would you like to do?'),
          AppTextButton(
            label: 'Scan QR',
            onTap: () {},
          ),
        ],
      );
}

class _WhiteBox extends StatelessWidget {
  final Widget content;

  const _WhiteBox({required this.content, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.backgroundColorWhite,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            AppDimms.homeScreenBorderRadius,
          ),
        ),
      ),
      child: content,
    );
  }
}

class _HomeScreenHeader extends StatelessWidget {
  final User user;

  const _HomeScreenHeader({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Welcome back,\n${user.fullName}',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
        AppIconButton(
          icon: Icons.menu_rounded,
          onTap: () {},
          color: AppTheme.primaryAccent,
        ),
      ],
    );
  }
}
