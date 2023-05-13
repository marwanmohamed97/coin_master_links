import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomLinkWidget extends StatefulWidget {
  const CustomLinkWidget({
    Key? key,
    required this.color,
    required this.icon,
    required this.link,
    required this.isCoinLink,
  }) : super(key: key);

  final Color color;
  final IconData icon;
  final Map link;
  final bool isCoinLink;

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

  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // <-- SEE HERE
          title: const Text('Are you sure to open?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text(
                    'This link will be opened. Do you want to leave this application then open it now?'),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[300]),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "No",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: widget.isCoinLink == true
                              ? Colors.yellow
                              : Colors.blue,
                        ),
                        onPressed: () {
                          _launchURL();
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Yes",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          // actions: <Widget>[
          //   TextButton(
          //     child: const Text(
          //       'No',
          //       style: TextStyle(color: Colors.black),
          //     ),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          //   ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor:
          //           widget.isCoinLink == true ? Colors.yellow : Colors.blue,
          //     ),
          //     onPressed: () {
          //       _launchURL();
          //       Navigator.of(context).pop();
          //     },
          //     child: const Text(
          //       "Yes",
          //       style: TextStyle(color: Colors.black),
          //     ),
          //   ),
          // ],
        );
      },
    );
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
