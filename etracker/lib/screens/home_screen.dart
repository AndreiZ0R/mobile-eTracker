import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;

import 'package:etracker/constants/country_prefixes.dart';
import 'package:etracker/screens/scan_screen.dart';
import 'package:etracker/theming/app_assets.dart';
import 'package:etracker/theming/app_dimms.dart';
import 'package:etracker/widgets/AppTextButton.dart';
import 'package:etracker/widgets/app_card.dart';
import 'package:etracker/widgets/app_tile.dart';
import 'package:etracker/widgets/dynamic_card.dart';
import 'package:etracker/widgets/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/user_model.dart';
import '../theming/app_theme.dart';
import '../widgets/carousel_wrapper.dart';
import '../widgets/user_card.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _user = const User(
    address: 'Constantin Brancusi 175-177',
    companyName: 'Q_Perior',
    countryPrefix: 40,
    fullName: 'Andrei Borza',
    id: 1,
    phone: 727752379,
    active: 1,
  );

  Future<String> infoString() async {
    final res = await CountriesHelper.getCountryById(_user.countryPrefix);
    return '${_user.companyName}, ${_user.address}, $res';
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      body: SafeArea(
        child: Container(
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
                          FutureBuilder<String>(
                            future: infoString(),
                            builder: (BuildContext ctx,
                                AsyncSnapshot<String> snapshot) {
                              return snapshot.connectionState ==
                                      ConnectionState.waiting
                                  ? Text(
                                      '${_user.companyName}, ${_user.address}, ${AppLocalizations.of(context)!.unknown} ',
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                            color:
                                                AppTheme.backgroundColorWhite,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    )
                                  : Text(
                                      snapshot.data!,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                            color:
                                                AppTheme.backgroundColorWhite,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    );
                            },
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
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: AppDimms.xxlPadding,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: AppDimms.mediumPadding,
                      ),
                      child: Column(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.homeScreenWouldText,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                  color: AppTheme.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: AppDimms.mediumPadding),
                          // _ItemList(),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppDimms.xlPadding,
                              ),
                              child: DynamicSlider(
                                items: [
                                  CarouselWrapper(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (ctx) => const ScanScreen(),
                                        ),
                                      );
                                    },
                                    child: _PicWithText(
                                      label: AppLocalizations.of(context)!
                                          .scanQRcode,
                                      imgSrc: AppAssets.scanQrBGless,
                                    ),
                                  ),
                                  CarouselWrapper(
                                    onTap: () {},
                                    child: _PicWithText(
                                      label: AppLocalizations.of(context)!
                                          .checkReports,
                                      imgSrc: AppAssets.checkReports,
                                    ),
                                  ),
                                  CarouselWrapper(
                                    onTap: () {},
                                    child: _PicWithText(
                                      label: AppLocalizations.of(context)!
                                          .createReport,
                                      imgSrc: AppAssets.createReport,
                                    ),
                                  ),
                                  CarouselWrapper(
                                    onTap: () {},
                                    child: _PicWithText(
                                      label: AppLocalizations.of(context)!
                                          .listItems,
                                      imgSrc: AppAssets.listItems,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppDimms.xlPadding,
                              vertical: AppDimms.defaultPadding,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.swipeLeft,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        color: AppTheme.primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                const Icon(
                                  Icons.swipe_left,
                                  color: AppTheme.secondaryColor,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _PicWithText extends StatelessWidget {
  final String imgSrc;
  final String label;

  const _PicWithText({required this.imgSrc, required this.label, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          imgSrc,
          fit: BoxFit.cover,
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: AppTheme.secondaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}

class _ItemList extends StatelessWidget {
  const _ItemList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 10, //TODO FIX LATER
          itemBuilder: (ctx, idx) {
            return const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimms.defaultPadding,
                vertical: AppDimms.mediumPadding,
              ),
              child: AppTile(
                iconColor: AppTheme.backgroundColorWhite,
                iconBackgroundColor: AppTheme.primaryColor,
              ),
            );
          }),
    );
  }
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
          '${AppLocalizations.of(context)!.welcomeBack},\n${user.fullName}',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: AppTheme.backgroundColorWhite,
                fontWeight: FontWeight.bold,
              ),
        ),
        AppIconButton(
          icon: Icons.menu_rounded,
          onTap: () async {
            final data = await fetchItems();
            final List<dynamic> elements = json.decode(data.body);
            // print('${body}');

            print(elements[0]);
          },
          color: AppTheme.primaryAccent,
        ),
      ],
    );
  }
}

Future<http.Response> fetchItems() {
  return http.get(Uri.parse('https://2877-109-97-98-41.eu.ngrok.io/items/get'));
}
