import 'package:flutter/material.dart';

class CustomFeaturedWidget extends StatelessWidget {
  const CustomFeaturedWidget({
    Key? key,
    required this.color,
    required this.width,
    required this.height,
    required this.icon,
    required this.title,
    required this.iconSize,
    required this.onTap,
  }) : super(key: key);

  final Color color;
  final double width;
  final double height;
  final IconData icon;
  final String title;
  final double iconSize;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: color,
        ),
        width: width,
        height: height,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              size: iconSize,
              color: Colors.white,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 22, color: Colors.white),
            ),
          ],
        )),
      ),
    );
  }
}
