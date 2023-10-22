import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spin_links/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:upgrader/upgrader.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      upgrader: Upgrader(
        durationUntilAlertAgain: const Duration(milliseconds: 1),
        onIgnore: () {
          SystemNavigator.pop();
          throw UnsupportedError('_');
        },
        onLater: () {
          SystemNavigator.pop();
          throw UnsupportedError('_');
        },
      ),
      child: const HomeviewBody(),
    );
  }
}
