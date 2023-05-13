import 'package:flutter/material.dart';

import 'custom_list_of_coins.dart';

class CoinLinksViewBody extends StatelessWidget {
  const CoinLinksViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Coin Links'),
          backgroundColor: Colors.yellow[700],
        ),
        body: CustomListOfCoins(
          color: Colors.yellow[700]!,
          icon: Icons.monetization_on,
        ),
      ),
    );
  }
}
