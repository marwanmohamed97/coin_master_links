import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../constats.dart';

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
  void _launchURL() async {
    String reward = widget.link['link'];
    String url =
        'coinmaster://promotions?af_deeplink=true&campaign=${reward.substring(70)}';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
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
                          // getclickedLinks();
                          // Navigator.of(context).pop();
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
                          setClickedLinks(
                            widget.link['link'],
                          );
                          setState(() {});
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
        );
      },
    );
  }

  void setClickedLinks(String url) async {
    final prefs = await SharedPreferences.getInstance();
    if (clickedLinks.contains(url) == false) {
      clickedLinks.add(url);
      prefs.setStringList('clickedLinks', clickedLinks);
    }
  }

  void initGetLinks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    clickedLinks = prefs.getStringList('clickedLinks')!;
    setState(() {});
  }

  @override
  void initState() {
    initGetLinks();

    super.initState();
  }

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
            color: clickedLinks.contains(widget.link['link'])
                ? Colors.white
                : Colors.grey[300],
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: 90,
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
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          widget.link['date'],
                          style: const TextStyle(color: Colors.black),
                          overflow: TextOverflow.clip,
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 30,
                  color: widget.color,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
