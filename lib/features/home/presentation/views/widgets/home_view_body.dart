import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:spin_links/features/home/presentation/views/widgets/privacy_policy_view.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/utils/app_router.dart';
import 'custom_featured_widget.dart';

class HomeviewBody extends StatelessWidget {
  const HomeviewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomFeaturedWidget(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.coinLinks);
                    },
                    iconSize: 46,
                    color: Colors.yellow[800]!,
                    height: 150,
                    icon: Icons.monetization_on,
                    title: 'Coin Links',
                    width: MediaQuery.of(context).size.width / 2.5,
                  ),
                  CustomFeaturedWidget(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.spinLinks);
                    },
                    color: Colors.blue,
                    height: 150,
                    icon: Icons.offline_bolt,
                    title: 'Spin Links',
                    width: MediaQuery.of(context).size.width / 2.5,
                    iconSize: 46,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomFeaturedWidget(
                    onTap: () {
                      Share.share(
                          'https://play.google.com/store/apps/details?id=com.example.spin_links');
                    },
                    color: Colors.green,
                    height: 100,
                    icon: Icons.share,
                    title: 'Share',
                    width: MediaQuery.of(context).size.width / 2.5,
                    iconSize: 36,
                  ),
                  CustomFeaturedWidget(
                    onTap: () async {
                      String url = 'market://details?id=com.example.spin_links';
                      final uri = Uri.parse(url);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri);
                      } else {
                        throw 'Could not launch $uri';
                      }
                    },
                    color: Colors.green,
                    height: 100,
                    icon: Icons.stars,
                    title: 'Rate Us',
                    width: MediaQuery.of(context).size.width / 2.5,
                    iconSize: 36,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.privacyPolicy);
                  },
                  child: const PrivacyPolicyView()),
            ],
          ),
        ),
      ),
    );
  }
}
