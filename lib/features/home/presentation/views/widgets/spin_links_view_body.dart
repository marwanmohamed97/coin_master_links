import 'package:flutter/material.dart';
import 'package:spin_links/features/home/presentation/views/widgets/custom_list_of_spins.dart';

import 'custom_list_of_coins.dart';

class SpinLinksViewBody extends StatelessWidget {
  const SpinLinksViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Spin Links'),
      ),
      body: const CustomListOfSpins(
        color: Colors.blue,
        icon: Icons.offline_bolt,
      ),
    );
  }
}
