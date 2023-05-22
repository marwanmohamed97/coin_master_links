import 'dart:io';
import 'package:flutter/material.dart';
import 'package:spin_links/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // final RateMyApp _rateMyApp = RateMyApp(
  //   preferencesPrefix: 'rateMyApp_',
  //   minDays: 0,
  //   minLaunches: 2,
  //   remindDays: 2,
  //   remindLaunches: 5,
  //   googlePlayIdentifier: 'com.spinmaster.coinmasterfreespin.spinlink',
  // );
  @override
  void initState() {
    // _rateMyApp.init().then((_) {
    //   if (_rateMyApp.shouldOpenDialog) {
    //     _rateMyApp.showRateDialog(
    //       context,
    //       title: 'Rate this app',
    //       message:
    //           'If you like this app, please take a little bit of your time to review it !\nIt really helps us and it shouldn\'t take you more than one minute.', // The dialog message.
    //       rateButton: 'RATE',
    //       noButton: 'NO THANKS',
    //       laterButton: 'MAYBE LATER',
    //       listener: (button) {
    //         switch (button) {
    //           case RateMyAppDialogButton.rate:
    //             print('Clicked on "Rate".');
    //             break;
    //           case RateMyAppDialogButton.later:
    //             print('Clicked on "Later".');
    //             break;
    //           case RateMyAppDialogButton.no:
    //             print('Clicked on "No".');
    //             break;
    //         }

    //         return true;
    //       },
    //       ignoreNativeDialog: false,
    //       dialogStyle: const DialogStyle(),
    //       onDismissed: () =>
    //           _rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed),
    //     );
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const HomeviewBody();
  }
}
