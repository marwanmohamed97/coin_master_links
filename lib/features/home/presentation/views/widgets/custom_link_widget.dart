import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomLinkWidget extends StatefulWidget {
  const CustomLinkWidget({
    Key? key,
    required this.color,
    required this.icon,
    required this.link,
  }) : super(key: key);

  final Color color;
  final IconData icon;
  final Map link;

  @override
  State<CustomLinkWidget> createState() => _CustomLinkWidgetState();
}

class _CustomLinkWidgetState extends State<CustomLinkWidget> {
  _launchURL() async {
    String reward = widget.link['link'];
    String url =
        'coinmaster://promotions?af_deeplink=true&campaign=${reward.substring(70)}';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
      print(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  _showAlertDialog() async {
    return showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              height: MediaQuery.of(context).size.height / 3,
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: [
                  const Text(
                    'Are you sure to open?',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    'This link will be opened. Do you want to leave this application then open it now?',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "No",
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Yes",
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  String? linkss;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: GestureDetector(
        onTap: () {
          _showAlertDialog();
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: 80,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      widget.icon,
                      size: 40,
                      color: widget.color,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.8,
                          child: Text(
                            widget.link['title'],
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          widget.link['date'],
                          style: const TextStyle(color: Colors.grey),
                          overflow: TextOverflow.clip,
                        ),
                      ],
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 30,
                  color: Colors.blue,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
