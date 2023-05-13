import 'package:flutter/material.dart';

class PrivacyPolicyViewBody extends StatelessWidget {
  const PrivacyPolicyViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.yellow[900],
      ),
      width: double.infinity,
      height: 80,
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.policy,
            color: Colors.white,
            size: 32,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            'Privacy Policy',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ],
      )),
    );
  }
}
