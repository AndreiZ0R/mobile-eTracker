import 'package:etracker/api/rest_api.dart';
import 'package:etracker/widgets/primary_appbar.dart';
import 'package:flutter/material.dart';

import '../theming/app_dimms.dart';
import '../theming/app_theme.dart';

import '../widgets/app_tile.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum ViewState {
  allItems,
  singleItem,
}

class RedirectScreen extends StatelessWidget {
  final Map<String, dynamic>? obj;
  final String? url;
  final RestApi api = RestApi();

  RedirectScreen({this.url, Key? key, this.obj}) : super(key: key);

  Future<dynamic> getUrlItem(String? url) async {
    final res = api.getRequestedUrl(currentUrl);
    return res;
  }

  String get currentUrl => url ?? api.allItems;

  ViewState get currentViewState =>
      currentUrl == api.allItems ? ViewState.allItems : ViewState.singleItem;

  String getTitle(BuildContext context) =>
      currentViewState == ViewState.allItems
          ? AppLocalizations.of(context)!.scannedItems
          : obj?['name'] ?? AppLocalizations.of(context)!.scannedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        customIconColor: currentViewState == ViewState.singleItem
            ? AppTheme.primaryColor
            : null,
        hasBackButton: true,
        bigLabel: getTitle(context),
        customTitleStyle: currentViewState == ViewState.singleItem
            ? Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: AppTheme.primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )
            : null,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppTheme.backgroundColorWhite,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: currentViewState == ViewState.allItems
                ? LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppTheme.greyishBackgroundColor.withOpacity(0.3),
                      AppTheme.greyishBackgroundColor.withOpacity(0.5),
                    ],
                  )
                : null,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(
                AppDimms.xlBorderRadius,
              ),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(
                AppDimms.xlBorderRadius,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimms.defaultPadding,
                vertical: AppDimms.defaultPadding,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimms.mediumPadding,
                      vertical: AppDimms.mediumPadding,
                    ),
                    child: Text(
                      currentViewState == ViewState.allItems
                          ? AppLocalizations.of(context)!.list
                          : '',
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: AppTheme.secondaryColor,
                              ),
                    ),
                  ),
                  if (currentViewState == ViewState.allItems)
                    const SizedBox(height: AppDimms.xxlPadding),
                  FutureBuilder(
                      future: getUrlItem(currentUrl),
                      builder: (ctx, snapshot) {
                        return snapshot.connectionState ==
                                ConnectionState.waiting
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: AppTheme.primaryColor,
                                ),
                              )
                            : (currentViewState == ViewState.allItems
                                ? Expanded(
                                    child: ListView.builder(
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (ctx, idx) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: AppDimms.xsPadding,
                                            ),
                                            child: AppTile(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        RedirectScreen(
                                                      url: ' ',
                                                      obj: snapshot.data[idx] ??
                                                          {"name": "Unknown"},
                                                    ),
                                                  ),
                                                );
                                              },
                                              placeHolder: snapshot.data[idx]
                                                  ['name'],
                                              backgroundColor:
                                                  getNthItemColor(idx + 1),
                                              labelColor: getNthItemColor(idx),
                                              iconColor:
                                                  getNthItemColor(idx + 1),
                                              iconBackgroundColor:
                                                  getNthItemColor(idx),
                                            ),
                                          );
                                        }),
                                  )
                                : Center(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.7,
                                      width: MediaQuery.of(context).size.width *
                                          0.90,
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Color(0xFF007991),
                                                Color(0xFF78ffd6),
                                              ]),
                                          borderRadius: BorderRadius.circular(
                                            AppDimms.bigBorderRadius,
                                          )),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 15,
                                            ),
                                            child: Center(
                                              child: CircleAvatar(
                                                child: Padding(
                                                  padding: EdgeInsets.all(0),
                                                  child: Icon(
                                                    Icons.camera_outlined,
                                                    size: 100,
                                                  ),
                                                ),
                                                backgroundColor: AppTheme
                                                    .backgroundColorWhite,
                                                foregroundColor:
                                                    Color(0xFF78ffd6),
                                                minRadius: 80,
                                              ),
                                            ),
                                          ),
                                          _ItemDetail(
                                            leftLabel:
                                                '${AppLocalizations.of(context)!.id} ',
                                            rightLabel: '${obj?['id']}',
                                          ),
                                          _ItemDetail(
                                            leftLabel:
                                                '${AppLocalizations.of(context)!.description} ',
                                            rightLabel: '${obj?['dsc'] ?? '-'}',
                                          ),
                                          _ItemDetail(
                                            leftLabel:
                                                '${AppLocalizations.of(context)!.created} ',
                                            rightLabel: '${obj?['created_at']}',
                                          ),
                                          _ItemDetail(
                                            leftLabel:
                                                '${AppLocalizations.of(context)!.lastRevised} ',
                                            rightLabel:
                                                '${obj?['last_revised']}',
                                          ),
                                          _ItemDetail(
                                            leftLabel:
                                                '${AppLocalizations.of(context)!.nextRevision} ',
                                            rightLabel:
                                                '${obj?['revision_interval']} days',
                                          ),
                                          _ItemDetail(
                                            leftLabel:
                                                '${AppLocalizations.of(context)!.location} ',
                                            rightLabel: '${obj?['location']}',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color getNthItemColor(int n) {
    return n % 2 == 0 ? AppTheme.primaryColor : AppTheme.backgroundColorWhite;
  }
}

class _ItemDetail extends StatelessWidget {
  final String? leftLabel;
  final String? rightLabel;

  const _ItemDetail({this.leftLabel, this.rightLabel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return leftLabel == null
        ? SizedBox()
        : Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimms.mediumPadding,
              vertical: AppDimms.mediumPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (leftLabel != null)
                  Text(
                    leftLabel!,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.backgroundColorWhite,
                          fontSize: 25,
                        ),
                  ),
                if (rightLabel != null)
                  Text(
                    rightLabel!,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.backgroundColorWhite,
                          fontSize: 25,
                        ),
                  ),
              ],
            ),
          );
  }
}
