import 'package:etracker/screens/redirect_screen.dart';
import 'package:etracker/widgets/icon_button.dart';
import 'package:etracker/widgets/primary_appbar.dart';
import 'package:flutter/material.dart';

import '../theming/app_dimms.dart';
import '../theming/app_theme.dart';

import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        bigLabel: AppLocalizations.of(context)!.scanQRcode,
        hasBackButton: true,
        smallLabel: AppLocalizations.of(context)!.placeCameraTowardsACode,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppTheme.backgroundColorWhite,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: AppTheme.greyishBackgroundColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(
                AppDimms.xlBorderRadius,
              ),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(
                AppDimms.xlBorderRadius,
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                MobileScanner(
                  allowDuplicates: false,
                  onDetect: (barcode, args) {
                    if (barcode.rawValue == null) {
                    } else {
                      UrlBookmark mark = barcode.url!;
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => RedirectScreen(
                            url: barcode.rawValue!,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
