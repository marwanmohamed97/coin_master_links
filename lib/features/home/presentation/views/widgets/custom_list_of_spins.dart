import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../data/ad_helper.dart';
import 'ad_for_listView.dart';
import 'custom_link_widget.dart';

const int maxFailedLoadAttempts = 3;

class CustomListOfSpins extends StatefulWidget {
  const CustomListOfSpins({
    Key? key,
    required this.color,
    required this.icon,
  }) : super(key: key);

  final Color color;
  final IconData icon;

  @override
  State<CustomListOfSpins> createState() => _CustomListOfSpinsState();
}

class _CustomListOfSpinsState extends State<CustomListOfSpins> {
  late BannerAd _bottomBannerAd;
  bool _isBottomBannerAdLoaded = false;

  void _createBottomBannerAd() {
    _bottomBannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBottomBannerAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    _bottomBannerAd.load();
  }

  InterstitialAd? _interstitialAd;
  int _interstitialLoadAttempts = 0;

  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          _interstitialLoadAttempts = 0;
        },
        onAdFailedToLoad: (LoadAdError error) {
          _interstitialLoadAttempts += 1;
          _interstitialAd = null;
          if (_interstitialLoadAttempts <= maxFailedLoadAttempts) {
            _createInterstitialAd();
          }
        },
      ),
    );
  }

  void _showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          _createInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          _createInterstitialAd();
        },
      );
      _interstitialAd!.show();
    }
  }

  @override
  void initState() {
    super.initState();
    _createBottomBannerAd();
    _createInterstitialAd();
  }

  @override
  void dispose() {
    super.dispose();
    _interstitialAd?.dispose();
    _bottomBannerAd.dispose();
  }

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

          return WillPopScope(
            onWillPop: () {
              _showInterstitialAd();
              Navigator.pop(context);
              return Future.value(false);
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  if ((index + 1) % 4 == 0) {
                    return const BannerAdmob();
                  } else {
                    return Container();
                  }
                },
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: lin.length,
                itemBuilder: (context, index) {
                  lenght--;
                  return CustomLinkWidget(
                    color: Colors.blue,
                    icon: Icons.offline_bolt_rounded,
                    link: lin[lenght],
                    isCoinLink: false,
                  );
                },
              ),
            ),
          );
        }

        return Center(
          child: LoadingAnimationWidget.discreteCircle(
              color: Colors.yellow[700]!, size: 40),
        );
      },
    );
  }
}
