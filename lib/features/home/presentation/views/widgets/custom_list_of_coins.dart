import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'custom_link_widget.dart';

class CustomListOfCoins extends StatelessWidget {
  const CustomListOfCoins({
    Key? key,
    required this.color,
    required this.icon,
  }) : super(key: key);

  final Color color;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('links');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc('coin_links').get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          List lin = data['coin_links'];
          int lenght = lin.length;
          return ListView.builder(
            itemCount: lin.length,
            itemBuilder: (context, index) {
              lenght--;
              return CustomLinkWidget(
                color: Colors.yellow[700]!,
                icon: Icons.attach_money_outlined,
                link: lin[lenght],
              );
            },
          );
        }

        return const Center(child: Text("loading"));
      },
    );
  }
}
