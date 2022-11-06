import 'package:etracker/widgets/icon_button.dart';
import 'package:flutter/material.dart';

import '../theming/app_dimms.dart';
import '../theming/app_theme.dart';

import 'package:mobile_scanner/mobile_scanner.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppIconButton(
          hasElevation: false,
          icon: Icons.arrow_back,
          onTap: () {
            Navigator.pop(context);
          },
          color: AppTheme.secondaryColor,
          backgroundColor: Colors.white,
        ),
        elevation: 0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Scan',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.secondaryColor,
                  ),
            ),
            Text(
              'Place your camera towards a readable QR code',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppTheme.secondaryColor,
                  ),
            ),
          ],
        ),
        backgroundColor: AppTheme.backgroundColorWhite,
        centerTitle: true,
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
          child: MobileScanner(
            allowDuplicates: false,
            onDetect: (barcode, args) {
              if (barcode.rawValue == null) {
                print('Failed scan');
              }
            },
          ),
        ),
      ),
    );
  }
}
