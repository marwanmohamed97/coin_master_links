import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../data/ad_helper.dart';
import 'custom_list_of_coins.dart';

class CoinLinksViewBody extends StatefulWidget {
  const CoinLinksViewBody({Key? key}) : super(key: key);

  @override
  State<CoinLinksViewBody> createState() => _CoinLinksViewBodyState();
}

class _CoinLinksViewBodyState extends State<CoinLinksViewBody> {
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

  @override
  void initState() {
    _createBottomBannerAd();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _bottomBannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: _isBottomBannerAdLoaded
            ? SizedBox(
                height: _bottomBannerAd.size.height.toDouble(),
                width: _bottomBannerAd.size.width.toDouble(),
                child: AdWidget(ad: _bottomBannerAd),
              )
            : null,
        appBar: AppBar(
          title: const Text('Coin Links'),
          backgroundColor: Colors.yellow[700],
        ),
        body: CustomListOfCoins(
          color: Colors.yellow[700]!,
          icon: Icons.monetization_on,
        ),
      ),
    );
  }
}
