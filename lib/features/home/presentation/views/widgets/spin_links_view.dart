import 'package:flutter/material.dart';
import 'spin_links_view_body.dart';

class SpinLinksView extends StatelessWidget {
  const SpinLinksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const SpinLinksViewBody());
  }
}
