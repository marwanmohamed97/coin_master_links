import 'package:flutter/material.dart';
import 'coin_links_view_body.dart';

class CoinLinksView extends StatelessWidget {
  const CoinLinksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const CoinLinksViewBody());
  }
}
