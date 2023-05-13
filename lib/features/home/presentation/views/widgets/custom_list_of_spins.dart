import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'custom_link_widget.dart';

class CustomListOfSpins extends StatelessWidget {
  const CustomListOfSpins({
    Key? key,
    required this.color,
    required this.icon,
  }) : super(key: key);

  final Color color;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    CollectionReference links = FirebaseFirestore.instance.collection('links');

    return FutureBuilder<DocumentSnapshot>(
      future: links.doc('spin_links').get(),
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

          List lin = data['spin_links'];

          int lenght = lin.length;

          return ListView.builder(
            itemCount: lin.length,
            itemBuilder: (context, index) {
              lenght--;
              return CustomLinkWidget(
                color: Colors.blue,
                icon: Icons.offline_bolt_rounded,
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
